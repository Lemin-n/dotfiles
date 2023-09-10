{ config
, inputs
, systems
, pkgs
, ...
}: {
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
    ./virtualisation.nix
    ./xdg.nix
  ];
}
