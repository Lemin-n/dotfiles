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
    gitemail = "emiliorccp@gmail.com";
  };
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  #services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    #modesetting.enable = true;
    nvidiaSettings = true;
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "24.05 "; # Did you read the comment?
}
