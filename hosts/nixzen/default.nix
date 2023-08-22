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

  hardware.pulseaudio.enable = true;

  users.users.lemi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "docker" ];
    shell = with pkgs; zsh;
    packages = with pkgs; [
      brave
      rnix-lsp
      curl
      git
      tree
    ];
  };
  environment.systemPackages = with pkgs; [
    alacritty
    font-manager
    brave
    docker-compose
    winbox
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
    openssl
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
    rustup
    nodejs
    php
    go
    python3
  ];
  programs = {
    hyprland.enable = true;
    zsh = {
      enable = true;
      shellAliases = {
        nmr = "nmcli device wifi connect Ruscitti password UnaClave";
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
  services = {
    printing = {
      enable = true;
    };
    openssh = {
      enable = true;
    };
    spotifyd = {
      enable = true;
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

