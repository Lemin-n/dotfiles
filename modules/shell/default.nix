{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.usershell;
  shellAliases = {
    nmr = "nmcli device wifi connect Ruscitti password UnaClave";
    cat = "bat";
    cd = "z";
  };
  shellConfig = {
    zsh = {
      shellAliases = shellAliases;
      enableAutosuggestions = true;
      enableCompletion = true;
    };
    nushell = rec {
      shellAliases =
        shellAliases
        // {
          ls = "exa";
        };
      environmentVariables = {
        EDITOR = "nvim";
      };
      configFile.source = ./config.nu;
    };
  };
  selectedShell =
    if cfg.shell == pkgs.zsh
    then "zsh"
    else "nushell";
in {
  options.usershell = with lib; {
    shell = mkOption {
      type = types.enum [pkgs.zsh pkgs.nushell];
      default = pkgs.zsh;
    };
    user = mkOption {
      type = types.str;
    };
  };
  config = {
    users.users."${cfg.user}".shell = cfg.shell;

    home-manager.users."${cfg.user}".programs."${selectedShell}" = shellConfig.nushell;
  };
}
