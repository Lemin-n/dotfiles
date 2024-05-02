{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.zoxide;
in
  with lib; {
    options.zoxide = {
      enable = mkEnableOption "Enable Zenix Zoxide";
      shell = mkOption {
        type = types.enum [pkgs.zsh pkgs.nushell];
      };
    };

    config = mkIf cfg.enable {
      programs.zoxide = {
        enable = true;
        enableZshIntegration = cfg.shell == pkgs.zsh;
      };
      home.file.".cache/zoxide/init.nu" = mkIf (cfg.shell
        == pkgs.nushell) {
        source = ../shell/init.nu;
      };
    };
  }
