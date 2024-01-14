{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  zenix = {
    username = "lemi";
    shell = pkgs.nushell;
    groups = ["wheel" "video" "docker" "networkmanager"];
    extraPackages = with pkgs; [
      amdctl
      youtube-tui
      spot
      google-chrome
    ];
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = " 24.05 "; # Did you read the comment?
}
