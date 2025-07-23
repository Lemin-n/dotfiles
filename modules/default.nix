{
  config,
  pkgs,
  inputs,
  ...
}: let
  zenix = config.zenix;
  system = pkgs.system;
in {
  imports = [
    ./boot.nix
    ./environment.nix
    ./fonts.nix
    ./hardware.nix
    ./i18n.nix
    ./network.nix
    ./programs.nix
    ./services.nix
    ./sound.nix
    ./time.nix
    ./torrent.nix
    ./virtualisation.nix
    ./xdg.nix
  ];

  options.zenix = with pkgs.lib; {
    username = mkOption {
      type = types.str;
    };
    virtManager = mkEnableOption "Enable virt manager for this host";
    docker = mkEnableOption "Enable docker for this host";
    touchpad = mkEnableOption "Enable touchpad this host";
    gaming = mkEnableOption "Enable gaming suite this host";
    gitname = mkOption {
      type = types.str;
    };
    gitemail = mkOption {
      type = types.str;
    };
    normalUser = mkOption {
      type = types.bool;
      default = true;
    };
    homepath = mkOption {
      type = types.str;
      default = "/home/${zenix.username}";
    };
    shell = mkOption {
      type = types.enum [pkgs.zsh pkgs.nushell];
      default = pkgs.zsh;
    };
    groups = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [];
    };
  };

  config = {
    nixpkgs.overlays = [
      inputs.wired.overlays.default
    ];
    home-manager.sharedModules = [
      inputs.wired.homeManagerModules.default
      inputs.niri.homeModules.niri
    ];
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        libqt5pas
        xorg.libxcb
        xorg.libX11
        kdePackages.qtwayland
      ];
    };
    users.users."${zenix.username}" = {
      isNormalUser = zenix.normalUser;
      extraGroups = zenix.groups ++ (pkgs.lib.lists.optionals zenix.virtManager ["libvirtd"]);
      shell = zenix.shell;
    };
    users.groups.libvirtd.members = pkgs.lib.lists.optionals zenix.virtManager [zenix.username];
    home-manager.backupFileExtension = "backup";
    home-manager.users.${zenix.username} = {pkgs, ...}: {
      services.wired = {
        package = inputs.wired.packages.${system}.default;
        enable = true;
      };
      dconf.settings = pkgs.lib.attrsets.optionalAttrs zenix.virtManager {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = ["qemu:///system"];
          uris = ["qemu:///system"];
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
      nixpkgs.overlays = [inputs.fenix.overlays.default];
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

        packages = with pkgs;
          [
            docker-compose

            bluez

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

            dbeaver-bin

            seatd
            qbittorrent
          ]
          ++ zenix.extraPackages
          ++ pkgs.lib.lists.optionals zenix.gaming [
            protonup
            retroarch
            steam
          ];
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
      zenshell = {
        user = zenix.username;
        shell = zenix.shell;
        bat = true;
        eza = true;
        starship = true;
        ripgrep = true;
        zoxide = true;
        zellij = true;
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
        shell = zenix.shell;
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
    zenixPrograms = {
      hyprland = true;
      steam = zenix.gaming;
      virtManager = zenix.virtManager;
      light = zenix.touchpad;
    };
  };
}
