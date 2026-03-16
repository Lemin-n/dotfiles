{
  config,
  pkgs,
  inputs,
  ...
}:
let
  zenix = config.zenix;
  system = pkgs.system;
  modules = import ./options.nix { inherit pkgs; };
  optionals = pkgs.lib.lists.optionals;
in
{
  imports = [
    ./boot.nix
    ./environment.nix
    ./fonts.nix
    ./hardware.nix
    ./i18n.nix
    ./sound.nix
    ./gaming.nix
    ./network.nix
    ./programs.nix
    ./services.nix
    ./time.nix
    ./virtualisation.nix
    ./xdg.nix
  ];

  options.zenix = with pkgs.lib; {
    username = mkOption {
      type = types.str;
    };
    configuredShell = {
      userShell = modules.userShell;
      bat = modules.bat;
      eza = modules.eza;
      starship = modules.starship;
      ripgrep = modules.ripgrep;
      zoxide = modules.zoxide;
      zellij = modules.zellij;
    };
    virtManager = modules.virtManager;
    docker = modules.docker;
    touchpad = modules.touchpad;
    gaming = modules.gaming;
    gitname = modules.gitname;
    gitemail = modules.gitemail;
    normalUser = modules.normalUser;
    homepath = modules.homepath zenix.username;
    groups = modules.groups;
    extraPackages = modules.extraPackages;
    avahi = modules.avahi;
    printing = modules.printing;
    ssh = modules.ssh;
    gui = modules.gui;
    bluetooth = modules.bluetooth;
    batteryDevice = modules.batteryDevice;
    torrent = modules.torrent;
    ntp = modules.ntp;
    networking = modules.networking;
    soundBackend = modules.soundBackend;
  };

  config = {
    nixpkgs.overlays = [
      inputs.antigravity-nix.overlays.default
    ];
    home-manager.sharedModules = [
      inputs.niri.homeModules.niri
    ];
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        libsForQt5.libqtpas
        xorg.libxcb
        xorg.libX11
        kdePackages.qtwayland
      ];
    };
    users.users."${zenix.username}" = {
      isNormalUser = zenix.normalUser;
      linger = true;
      extraGroups =
        zenix.groups
        ++ (pkgs.lib.lists.optionals zenix.virtManager [ "libvirtd" ])
        ++ [ "audio" ]
        ++ (pkgs.lib.lists.optional zenix.networking.wireshark "wireshark");
      shell = zenix.configuredShell.userShell.shell;
    };
    users.groups.libvirtd.members = pkgs.lib.lists.optionals zenix.virtManager [ zenix.username ];
    home-manager.backupFileExtension = "backup";
    home-manager.users.${zenix.username} =
      { pkgs, ... }:
      {
        dconf.settings = pkgs.lib.attrsets.optionalAttrs zenix.virtManager {
          "org/virt-manager/virt-manager/connections" = {
            autoconnect = [ "qemu:///system" ];
            uris = [ "qemu:///system" ];
          };
        };
        imports = [
          ./alacritty
          ./shell

          # Bins
          ./htop
          ./git

          # Dev env
          ./nvim
          ./devEnv

          # Wayland config, unify all in one
          ./hyprland
          ./wofi
          ./waybar

          # X11 config, unify all in one
          ./rofi
          ./feh

          # Utils
          ./socials
          ./wallpapers.nix
          ./youtube
        ];

        nixpkgs.config.allowUnfree = true;
        nixpkgs.overlays = [ inputs.fenix.overlays.default ];
        programs.home-manager.enable = true;
        #programs.niri = {
        #	enable = true;
        # settings = {
        #   prefer-no-csd = true;
        #   hotkey-overlay.skip-at-startup = true;
        #   environment = {
        #     DISPLAY = ":0";
        #   };
        #   spawn-at-startup = [
        #     {command = ["alacritty"];}
        #     {command = ["brave"];}
        #   ];
        #   binds = {
        #     "Mod+Ctrl+Escape".action.quit.skip-confirmation = true;
        #   };
        # };
        # };
        home = {
          stateVersion = "24.05";

          username = zenix.username;
          homeDirectory = zenix.homepath;
          # Iterate over zellij config file, layout and plugin folder
          file.".config/script/screenshot" = {
            executable = true;
            source = ../script/screenshot;
          };
          file.".config/script/ssheleport" =
            let
              script = pkgs.writeShellScript "wofi-ssh" ''
                CONFIG="${zenix.homepath}/.config/wofi/remote.ssh"
                CONFIG_DIR="${zenix.homepath}/.config/wofi"
                DEFAULT_ICON="$CONFIG_DIR/default-icon.png"
                TERM_EMU="${pkgs.lib.meta.getExe pkgs.alacritty} --command ${pkgs.lib.meta.getExe pkgs.bash} -c"

                ITEMS=""
                name=""
                host=""
                user=""
                icon=""
                extra_args=""

                process_item() {
                    if [ -n "$name" ] && [ -n "$host" ]; then
                        [ -z "$user" ] && user="$USER"
                        
                        if [ -z "$icon" ]; then
                            icon="$DEFAULT_ICON"
                        else
                            eval "resolved_icon=$icon"
                            case "$resolved_icon" in
                                /*) 
                                    [ ! -f "$resolved_icon" ] && icon="$DEFAULT_ICON" || icon="$resolved_icon"
                                    ;;
                                *) 
                                    [ ! -f "$CONFIG_DIR/$resolved_icon" ] && icon="$DEFAULT_ICON" || icon="$CONFIG_DIR/$resolved_icon"
                                    ;;
                            esac
                        fi
                        ITEMS="$ITEMS$name,$host,$user,$icon,$extra_args\n"
                    fi
                }

                while IFS= read -r line || [ -n "$line" ]; do
                    case "$line" in
                        \[*\])
                            process_item
                            name=$(echo "$line" | sed 's/^\[\(.*\)\]$/\1/')
                            host=""
                            user=""
                            icon=""
                            extra_args=""
                            ;;
                        host=*) host="''${line#host=}" ;;
                        user=*) user="''${line#user=}" ;;
                        icon=*) icon="''${line#icon=}" ;;
                        extra_args=*) extra_args="''${line#extra_args=}" ;;
                    esac
                done < "$CONFIG"
                process_item

                WOFI_INPUT=$(printf "%b" "$ITEMS" | while IFS=, read -r i_name i_host i_user i_icon i_extra; do
                    [ -n "$i_name" ] && printf "img:%s:text:%s\n" "$i_icon" "$i_name"
                done)

                SELECTION=$(echo "$WOFI_INPUT" | ${pkgs.lib.meta.getExe pkgs.wofi} --dmenu --allow-images -p "SSH:")
                [ -z "$SELECTION" ] && exit 0

                TARGET="''${SELECTION##*:text:}"

                SELECTED_ITEM=$(printf "%b" "$ITEMS" | grep "^$TARGET,")
                host=$(echo "$SELECTED_ITEM" | cut -d',' -f2)
                user=$(echo "$SELECTED_ITEM" | cut -d',' -f3)
                extra_args=$(echo "$SELECTED_ITEM" | cut -d',' -f5-)

                PASS=$(echo "" | ${pkgs.lib.meta.getExe pkgs.wofi} --dmenu --password -p "Password ($user@$host):")
                [ -z "$PASS" ] && exit 0

                $TERM_EMU "${pkgs.lib.meta.getExe pkgs.sshpass} -p '$PASS' ${pkgs.lib.meta.getExe pkgs.openssh} -t $user@$host $extra_args"
              '';
            in
            {
              executable = true;
              source = script;
            };

          packages =
            with pkgs;
            let
              enabled = bin: (bin && zenix.gaming.enable);
            in
            [
              wired
              docker-compose

              font-manager

              anydesk

              grim
              jq
              image-roll
              fastfetch

              #onlyoffice-bin

              spot
              spotifyd
              spotify

              google-chrome
              brave

              #dbeaver-bin

              seatd
              qbittorrent
            ]
            ++ zenix.extraPackages
            ++ (lib.lists.optionals zenix.bluetooth [
              bluez
            ])
            ++ lib.lists.optionals zenix.touchpad [ brightnessctl ]
            ++ optionals (enabled zenix.gaming.steam) [
              steam
            ]
            ++ optionals (enabled (zenix.gaming.steam or zenix.gaming.heroic)) [
              protonplus
            ]
            ++ optionals (enabled zenix.gaming.heroic) [ heroic ]
            ++ optionals (enabled zenix.gaming.retroarch) [ retroarch ];
        };
        manual = {
          html.enable = false;
          json.enable = false;
          manpages.enable = false;
        };
        wallpapers = {
          enable = true;
          name = zenix.username;
        };
        zenshell = zenix.configuredShell // {
          user = zenix.username;
        };
        devEnv = {
          rust = true;
          tauri = true;
          lua = true;
          bun = true;
          php = true;
          python = true;
        };
        zenprland = {
          enable = true;
          touchpad = zenix.touchpad;
          username = zenix.username;
          rounding = 0;
        };
        alacritty = {
          enable = true;
          shell = zenix.configuredShell.userShell.shell;
          name = zenix.username;
        };
        zentube = {
          music = true;
        };
        zengit = {
          enable = true;
          userName = zenix.gitname;
          userEmail = zenix.gitemail;
        };
      };
    virt = {
      virtManager = zenix.virtManager;
      docker = zenix.docker;
    };
    zenworks = zenix.networking;
    zenvices = {
      avahi = zenix.avahi;
      printing = zenix.printing;
      ssh = zenix.ssh;
      gui = zenix.gui;
      batteryDevice = zenix.batteryDevice;
      torrent = zenix.torrent;
      ntp = zenix.ntp;
    };
    zenixPrograms = {
      hyprland = true;
      virtManager = zenix.virtManager;
      light = zenix.touchpad;
    };
    gamenix = zenix.gaming;
    sounix = {
      bluetooth = zenix.bluetooth;
      soundBackend = zenix.soundBackend;
    };
  };
}
