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
      config = {
        shellAliases = shellAliases;
        enableAutosuggestions = true;
        enableCompletion = true;
      };
      files = {};
    };
    nushell = rec {
      config = {
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
      files = {
        file.".config/nushell/config.nu".source = ./config.nu;
        file.".config/nushell/env.nu".source = ./env.nu;
        file.".cache/zoxide/init.nu".source = ./init.nu;
      };
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

    home-manager.users."${cfg.user}" = let
      settings = shellConfig."${selectedShell}";
    in {
      programs."${selectedShell}" = settings.config;
      home = settings.files;
    };
  };
}
