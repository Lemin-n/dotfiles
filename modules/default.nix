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
              neofetch

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
