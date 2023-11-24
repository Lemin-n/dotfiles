{
  config,
  pkgs,
  ...
}: let
  zenix = config.zenix;
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
    normalUser = mkOption {
      type = types.bool;
      default = true;
    };
    homepath = mkOption {
      type = types.str;
      default = "/home/${zenix.username}";
    };
    shell = mkOption {
      type = types.enum [pkgs.zsh pkgs.nushell];
      default = pkgs.zsh;
    };
    groups = mkOption {
      type = types.listOf types.str;
      default = [];
    };
  };

  config = {
    users.users."${zenix.username}" = {
      isNormalUser = zenix.normalUser;
      extraGroups = zenix.groups;
    };

    wallpapers = {
      enable = true;
      name = zenix.username;
    };
    alacritty = {
      enable = true;
      shell = zenix.shell;
      name = zenix.username;
    };
  };
}
