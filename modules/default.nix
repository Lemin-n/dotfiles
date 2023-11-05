{
  config,
  inputs,
  systems,
  pkgs,
  ...
}: let
  utils = config.alacritty;
  graphServer = config.graphServer;
  git = config.git;
  neovim = config.neovim;
  ssh = config.ssh;

  # Merge
  shell = config.shell;
  alacritty = config.alacritty;
  starship = config.starship;

  # Configuration.nix
  boot = config.boot;
  fonts = config.fonts;
  sysPkgs = config.sysPkgs;

  scripts = config.scripts;
  nixPkgs = config.nixPkgs;
  envVars = config.envVars;
  customPkgs = config.customPkgs;
  networking = config.networking;
  xserver = config.xdg;
  time = config.time;
  docker = config.docker;
in {
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
    ./torrent.nix
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
