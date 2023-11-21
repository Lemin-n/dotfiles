{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../home
    ../../modules/users/lemi.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = " 23.05 "; # Did you read the comment?
}
