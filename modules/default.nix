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
    normalUser = mkOption {
      type = types.bool;
      default = true;
    };
    homepath = mkOption {
      type = types.str;
      default = "/home/${zenix.username}";
    };
    touchpad = mkEnableOption "Enable touchpad this host";
    shell = mkOption {
      type = types.enum [pkgs.zsh pkgs.nushell];
      default = pkgs.zsh;
    };
    dev-env = mkOption {
      type = types.submodule {
        options = {
          rust = mkEnableOption "Enable Rust development environment";
          lua = mkEnableOption "Enable Lua development environment";
          nix = mkEnableOption "Enable Nix development environment";
          php = mkEnableOption "Enable PHP development environment";
          node = mkEnableOption "Enable Node development environment";
          deno = mkEnableOption "Enable Deno development environment";
          python = mkEnableOption "Enable Python3 development environment";
          web = mkEnableOption "Enable Web development environment";
          go = mkEnableOption "Enable Go development environment";
        };
        config = {
          rust = true;
          lua = true;
          nix = true;
          php = true;
          node = true;
          python = true;
          web = true;
        };
      };
      default = {};
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
    ];

    home-manager.users.${zenix.username} = {pkgs, ...}: {
      services.wired = {
        package = inputs.wired.packages.${system}.default;
        enable = true;
      };
      imports = [
        ./alacritty
        ./hyprland
        ./shell
        ./nvim
        ./wallpapers.nix
      ];

      nixpkgs.config.allowUnfree = true;
      nixpkgs.overlays = [inputs.fenix.overlays.default];
      programs = {
        bat = import ./bat {inherit pkgs;};
        eza = import ./eza {inherit pkgs;};
        feh = import ./feh;
        git = import ./git {inherit pkgs;};
        gitui = import ./gitui {inherit pkgs;};
        htop = import ./htop {inherit pkgs;};
        ripgrep = import ./ripgrep;
        rofi = import ./rofi {inherit pkgs;};
        ssh = import ./ssh {inherit pkgs;};
        starship = import ./starship {inherit pkgs;};
        waybar = import ./waybar {inherit pkgs;};
        wofi = import ./wofi {inherit pkgs;};
        zellij = import ./zellij {inherit pkgs;};
        zoxide = import ./zoxide {inherit pkgs;};
        home-manager.enable = true;
      };
      home = {
        stateVersion = "24.05";

        username = zenix.username;
        homeDirectory = zenix.homepath;
        # Iterate over zellij config file, layout and plugin folder
        file.".config/zellij/config.kdl" = {
          source = ./zellij/config.kdl;
        };
        file.".config/zellij/layouts/default.kdl" = {
          text = ''
            layout {
                  pane size=1 borderless=true {
                      plugin location="zellij:compact-bar"
                  }
              }
          '';
        };
        file.".config/zellij/layouts/laravel-vite.kdl" = {
          text = ''
            layout {
                pane stacked=true {
                    pane command="./vendor/bin/sail" {
            			args "up"
            	       }
                    pane command="./vendor/bin/sail" start_suspended=true {
             			args "npx" "tailwind" "-i" "./resources/css/app.css" "-o" "./resources/css/style.css" "--watch"
             	      }
                    pane command="./vendor/bin/sail" start_suspended=true {
             			args "npm" "run" "dev"
            	      }
                }
            }
          '';
        };
        file.".config/script/screenshot" = {
          executable = true;
          source = ../script/screenshot;
        };

        packages = with pkgs.lib.lists; let
          deno-pkgs = optionals zenix.dev-env.deno [pkgs.deno];
          node-pkgs = optionals zenix.dev-env.node [pkgs.nodejs];
          rust-pkgs = optionals zenix.dev-env.rust [
            pkgs.fenix.complete.toolchain
            pkgs.cargo-leptos
            pkgs.leptosfmt
            pkgs.cargo-make
            pkgs.trunk
          ];
          php-pkgs = optionals zenix.dev-env.php [
            pkgs.php
            pkgs.php82Packages.composer
          ];
          go-pkgs = optionals zenix.dev-env.go [
            pkgs.go
          ];
          python-pkgs = optionals zenix.dev-env.python [
            pkgs.python3
          ];
          web-pkgs = optionals zenix.dev-env.web [
            pkgs.nodePackages.tailwindcss
          ];
          flatten-packages = flatten [deno-pkgs node-pkgs rust-pkgs php-pkgs go-pkgs python-pkgs web-pkgs];
        in
          flatten-packages
          ++ (with pkgs; [
            # Social
            telegram-desktop
            discord
            webcord
            # Script
            grim
            # Utils
            jq
            gftp
            image-roll
            neofetch
            felix-fm
            onlyoffice-bin

            # Bluetooth
            blueman
            # Gaming
            steam
            retroarch
            # Browser
            brave
            # Networking
            seatd
            qbittorrent
            zellij
          ])
          ++ zenix.extraPackages;
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
      usershell = {
        user = zenix.username;
        shell = zenix.shell;
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
    };
    users.users."${zenix.username}" = {
      isNormalUser = zenix.normalUser;
      extraGroups = zenix.groups;
      shell = zenix.shell;
    };
  };
}
