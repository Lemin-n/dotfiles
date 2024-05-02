{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.bat;
in
  with lib; {
    options.bat = {
      enable = mkEnableOption "Enable bat";
    };

    config = mkIf cfg.enable {
      programs.bat = {
        enable = cfg.enable;
        extraPackages = with pkgs.bat-extras; [batman batpipe batdiff batgrep batwatch prettybat];
        config = {
          map-syntax = [
            "*.jenkinsfile:Groovy"
            "*.props:Java Properties"
          ];
          pager = "less -FR";
          theme = "Nord";
          style = "header-filename,header-filesize,rule,numbers,snip,changes,header";
        };
      };
    };
  }
