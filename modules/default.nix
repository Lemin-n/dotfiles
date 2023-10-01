{ config
, inputs
, systems
, pkgs
, ...
}: {
  imports = [
    ./alacritty
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
    ./wallpapers.nix
    ./xdg.nix
  ];
  wallpapers = {
    enable = true;
    name = "lemi";
  };
  alacritty = {
    enable = true;
    name = "lemi";
  };
}
