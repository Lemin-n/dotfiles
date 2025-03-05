{
  pkgs,
  config,
  ...
}: {
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
    gaming = true;
    gitemail = "emiliorccp@gmail.com";
    extraPackages = with pkgs; [
      youtube-tui
      spot
      google-chrome
    ];
  };
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
  boot.kernelParams = ["nvidia_drm.modeset=1" "nvidia_drm.fbdev=1"];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    nvidiaPersistenced = true;
    #powerManagement.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    forceFullCompositionPipeline = true;
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.02";
}
