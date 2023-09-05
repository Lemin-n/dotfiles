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
  fonts.packages = with pkgs;[
    comic-mono
    (nerdfonts.override { fonts = [ "Agave" "ComicShannsMono" "UbuntuMono" ]; })
  ];

  networking = {
    hostName = "nixzen";
    networkmanager = {
      enable = true;
    };
  };
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Argentina/Rio_Gallegos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    useXkbConfig = true;
  };


  sound.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  users.users.lemi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "docker" "networkmanager" ];
    shell = with pkgs; bash;
  };
  programs = {
    zsh.enable = true;
    light = {
      enable = true;
    };
    hyprland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    git
    font-manager
    docker-compose
    winbox
    openssl
    openssh
    bluezFull
    pavucontrol
    wev
    ntfs3g
    gitoxide
    xdg-utils
    spotify-tui
    spotifyd
    spotify
    ripgrep
    gcc_multi
    curl
    wget
    zip
    unzip
    gnutar
  ];
  services = {
    printing = {
      enable = true;
    };
    spotifyd = {
      enable = true;
    };
    xserver = {
      layout = "
          us ";
      xkbVariant = "
          altgr-intl ";
    };
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
      };
    };
  };
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };

  };
  system.stateVersion = " 23.05 "; # Did you read the comment?
}


