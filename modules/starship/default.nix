{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.zoxide;
in
  with lib; {
    options.starship = {
      enable = mkEnableOption "Enable Zenix Starship";
      shell = mkOption {
        type = types.enum [pkgs.zsh pkgs.nushell];
      };
    };

    config = mkIf cfg.enable {
      programs.starship = {
        enable = cfg.enable;
        enableZshIntegration = cfg.shell == pkgs.zsh;
        settings = {
          add_newline = true;
          format = "$all";
          rust = {
            format = "[$symbol ($version ) ]($style)";
            version_format = "ver $\{major\}";
          };
          nix_shell = {
            symbol = "❄️ ";
            format = "[$symbol$state( \( [$name] \))]($style)";
          };
        };
      };
    };
  }
