{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];
  zenix = {
    username = "lemi";
    shell = pkgs.nushell;
    groups = ["wheel" "video" "docker" "networkmanager"];
    gitname = "Emilio Ruscitti";
    virtManager = true;
    docker = true;
    gitemail = "emiliorccp@gmail.com";
    extraPackages = with pkgs; [
      youtube-tui
      postgresql
      spot
      google-chrome
    ];
  };
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  #services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    #modesetting.enable = true;
    nvidiaSettings = true;
  };
  nixpkgs.config.allowUnfree = true;
  boot.initrd.systemd.dbus.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.02";
}
