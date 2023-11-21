{
  config,
  inputs,
  systems,
  pkgs,
  ...
}: let
  user = config.zenix;
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
    ./shell
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

  options.zenix = with pkgs.lib; {
    username = mkOption {
      type = types.str;
    };
    homepath = mkOption {
      type = types.str;
    };
    shell = mkOption {
      type = types.enum [pkgs.zsh pkgs.nushell];
      default = pkgs.zsh;
    };
    groups = mkOption {
      type = types.listOf types.str;
    };
  };

  config = {
    wallpapers = {
      enable = true;
      name = user.username;
    };
    usershell = {
      shell = pkgs.nushell;
      user = user.username;
    };
    alacritty = {
      enable = true;
      shell = user.shell;
      name = user.username;
    };
  };
}
