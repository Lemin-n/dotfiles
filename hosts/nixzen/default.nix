{ config, pkgs, inputs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  fonts.fonts = with pkgs;[
    comic-mono
    (nerdfonts.override { fonts = [ "Agave" "ComicShannsMono" "UbuntuMono" ]; })
  ];

  networking = {
    hostName = "nixzen";
    networkmanager = {
      enable = true;
    };
  };
  nixpkgs = { config.allowUnfree = true; };

  time.timeZone = "America/Argentina/Rio_Gallegos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    useXkbConfig = true;
  };


  sound.enable = true;

  hardware = {
    pulseaudio.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  users.users.lemi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "docker" "networkmanager" ];
    shell = with pkgs; zsh;
    packages = with pkgs; [
      brave
      rnix-lsp
      curl
      git
      tree
    ];
  };
  programs = {
    hyprland.enable = true;
    zsh = {
      enable = true;
      shellAliases = {
        nmr = "nmcli device wifi connect Ruscitti password UnaClave";
        ls = "exa -1lTFgHh -L 1 --octal-permissions -t changed --icons";
      };
      autosuggestions = {
        enable = true;
      };
      loginShellInit = "Hyprland";
    };
    light = {
      enable = true;
    };
    starship = {
      enable = true;
    };

  };
  environment.systemPackages = with pkgs; [
    alacritty
    font-manager
    brave
    stylua
    docker-compose
    neovim
    winbox
    openssl
    openssh
    telegram-desktop
    trunk
    deno
    nodePackages.tailwindcss
    nodePackages.prettier
    nodePackages."@tailwindcss/language-server"
    nodePackages.vscode-html-languageserver-bin
    nodePackages.vscode-css-languageserver-bin
    nodePackages.vscode-json-languageserver-bin
    nodePackages.intelephense
    nodePackages.pyright
    nodePackages.typescript-language-server
    nodePackages.yaml-language-server
    zls
    lua-language-server
    taplo
    bluezFull
    zsh
    zimfw
    pavucontrol
    zellij
    wev
    ntfs3g
    gitoxide
    xdg-utils
    hyprpaper
    spotify-tui
    spotifyd
    spotify
    discord
    ripgrep
    hyprpicker
    gcc_multi
    rnix-lsp
    wofi
    waybar
    git
    curl
    wget
    zip
    unzip
    gnutar
    rustup
    exa
    nodejs
    php
    go
    python3
  ];
  services = {
    printing = {
      enable = true;
    };
    spotifyd = {
      enable = true;
    };
    xserver = {
      layout = "us";
      xkbVariant = "altgr-intl";
    };
  };

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };

  };
  system.stateVersion = "23.05"; # Did you read the comment?
}

