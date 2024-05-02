{
  lib,
  config,
  ...
}: let
  cfg = config.eza;
in
  with lib; {
    options.eza = {
      enable = mkEnableOption "Enable Zenix Eza";
    };
    config = mkIf cfg.enable {
      programs.eza = {
        enable = cfg.enable;
        extraOptions = ["-1lTFgHh" "-L" "1" "--octal-permissions" "-t" "changed"];
        git = true;
        icons = true;
      };
    };
  }
