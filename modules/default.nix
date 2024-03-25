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
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
      libqt5pas
      xorg.libxcb
      xorg.libX11
      libsForQt5.qt5.qtwayland
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
        ./git
        ./nvim
        ./wallpapers.nix
        ./youtube
        ./zellij
      ];

      nixpkgs.config.allowUnfree = true;
      nixpkgs.overlays = [inputs.fenix.overlays.default];
      programs = {
        bat = import ./bat {inherit pkgs;};
        eza = import ./eza {inherit pkgs;};
        feh = import ./feh;
        gitui = import ./gitui {inherit pkgs;};
        htop = import ./htop {inherit pkgs;};
        ripgrep = import ./ripgrep;
        rofi = import ./rofi {inherit pkgs;};
        ssh = import ./ssh {inherit pkgs;};
        starship = import ./starship {inherit pkgs;};
        waybar = import ./waybar {inherit pkgs;};
        wofi = import ./wofi {inherit pkgs;};
        zoxide = import ./zoxide {inherit pkgs;};
        home-manager.enable = true;
      };
      home = {
        stateVersion = "24.05";

        username = zenix.username;
        homeDirectory = zenix.homepath;
        # Iterate over zellij config file, layout and plugin folder
        file.".config/script/screenshot" = {
          executable = true;
          source = ../script/screenshot;
        };

        packages = with pkgs.lib.lists; let
          #deno-pkgs = optionals zenix.dev-env.deno [pkgs.deno];
          #node-pkgs = optionals zenix.dev-env.node [pkgs.nodejs];
          bun-pkgs = optionals zenix.dev-env.node [pkgs.bun];
          rust-pkgs = optionals zenix.dev-env.rust (with pkgs; [
            fenix.complete.toolchain
            cargo-leptos
            cargo-shuttle
            leptosfmt
            cargo-make
            trunk
          ]);
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
          flatten-packages = flatten [bun-pkgs rust-pkgs php-pkgs go-pkgs python-pkgs web-pkgs];
        in
          flatten-packages
          ++ (with pkgs; [
            cargo-tauri
            slack
            telegram-desktop
            discord
            webcord
            bluez
            docker-compose

            font-manager

            anydesk
            winbox

            grim
            jq
            gftp
            image-roll
            postgresql
            neofetch
            felix-fm

            onlyoffice-bin

            spot
            spotify-tui
            spotifyd
            spotify

            google-chrome
            brave

            dbeaver

            steam
            retroarch

            seatd
            qbittorrent
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
      zentube = {
        music = true;
      };
      zengit = {
        enable = true;
        userName = zenix.gitname;
        userEmail = zenix.gitemail;
      };
    };
    users.users."${zenix.username}" = {
      isNormalUser = zenix.normalUser;
      extraGroups = zenix.groups;
      shell = zenix.shell;
    };
  };
}
