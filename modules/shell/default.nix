{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.zenshell;
  shellAliases = {
    nmr = "nmcli device wifi connect Ruscitti password UnaClave";
    cat = "bat";
    cd = "z";
  };
  shellConfig = {
    zsh = {
      config = {
        shellAliases = shellAliases;
        autosuggestion.enable = true;
        enableCompletion = true;
      };
      home = {
        packages = with pkgs; [zimfw];
      };
    };
    nushell = {
      config = {};
      home = {
        packages = [pkgs.carapace];
      };
    };
  };
  selectedShell = cfg.shell.pname;
in {
  options.zenshell = with lib; {
    shell = mkOption {
      type = types.enum [pkgs.zsh pkgs.nushell];
      default = pkgs.zsh;
    };
    user = mkOption {
      type = types.str;
    };
    bat = mkEnableOption "Enable bat util";
    eza = mkEnableOption "Enable eza util";
    starship = mkEnableOption "Enable starship util";
    ripgrep = mkEnableOption "Enable ripgrep util";
    zoxide = mkEnableOption "Enable zoxide util";
    zellij = mkEnableOption "Enable zellij util";
  };
  config = let
    settings = shellConfig."${selectedShell}";
  in {
    programs = {
      "${selectedShell}" = settings.config;
      bat = lib.mkIf cfg.bat {
        enable = cfg.bat;
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
      eza = lib.mkIf cfg.eza {
        enable = cfg.eza;
        extraOptions = ["-1lTFgHh" "-L" "1" "--octal-permissions" "-t" "changed"];
        git = true;
        icons = "auto";
      };
      starship = lib.mkIf cfg.starship {
        enable = cfg.starship;
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
      zoxide = lib.mkIf cfg.zoxide {
        enable = true;
        enableZshIntegration = cfg.shell == pkgs.zsh;
      };
      zellij = lib.mkIf cfg.zellij {
        enable = true;
      };
      ripgrep.enable = cfg.ripgrep;
    };
    home = with lib; {
      file = {
        ".config/zellij/config.kdl" = mkIf cfg.zellij {
          source = ./config.kdl;
        };
        ".config/zellij/layouts/laravel-vite.kdl" = mkIf cfg.zellij {
          source = ./laravel-vite.kdl;
        };
        ".config/zellij/layouts/default.kdl" = mkIf cfg.zellij {
          source = ./default-layout.kdl;
        };
        ".config/nushell/config.nu" = mkIf (cfg.shell == pkgs.nushell) {
          source = ./config.nu;
        };
        ".config/nushell/env.nu" = mkIf (cfg.shell == pkgs.nushell) {
          source = ./env.nu;
        };
        ".cache/zoxide/init.nu" = mkIf (cfg.shell == pkgs.nushell) {
          source = ./init.nu;
        };
      };
      inherit (settings.home) packages;
    };
  };
}
