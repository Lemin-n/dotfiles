{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.usershell;
  zenix = config.zenix;
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
      home = {
        packages = with pkgs; [zimfw];
      };
    };
    nushell = {
      config = {};
      home = {
        file = {
          ".config/nushell/config.nu".source = ./config.nu;
          ".config/nushell/env.nu".source = ./env.nu;
          ".cache/zoxide/init.nu".source = ./init.nu;
        };
        packages = [pkgs.carapace];
      };
    };
  };
  selectedShell = cfg.shell.pname;
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
  config = let
    settings = shellConfig."${selectedShell}";
  in {
    programs."${selectedShell}" = settings.config;
    home = {
      inherit (settings.home) file packages;
    };
  };
}
