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
  selectedShell = cfg.userShell.shell.pname;
  modules = import ../options.nix {inherit pkgs;};
in {
  options.zenshell = {
    userShell = modules.userShell;
    bat = modules.bat;
    eza = modules.eza;
    starship = modules.starship;
    ripgrep = modules.ripgrep;
    zoxide = modules.zoxide;
    zellij = modules.zellij;
    user = with lib;
      mkOption {
        type = types.str;
      };
  };
  config = let
    settings = shellConfig."${selectedShell}";
  in rec {
    programs = {
      "${selectedShell}" = settings.config;
      bat = lib.mkIf cfg.bat {
        enable = cfg.bat;
        extraPackages = with pkgs.bat-extras; [
          batman
          batpipe
          batdiff
          batgrep
          batwatch
          prettybat
        ];
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
        extraOptions = [
          "-1lTFgHh"
          "-L"
          "1"
          "--octal-permissions"
          "-t"
          "changed"
        ];
        git = true;
        icons = "auto";
      };
      starship = lib.mkIf cfg.starship {
        enable = cfg.starship;
        enableZshIntegration = cfg.userShell.shell == pkgs.zsh;
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
        enableZshIntegration = cfg.userShell.shell == pkgs.zsh;
      };
      zellij = lib.mkIf cfg.zellij.enable {
        enable = true;
      };
      ripgrep.enable = cfg.ripgrep;
    };
    home = let
      toHomeFile =
        (lib.listToAttrs (
          lib.lists.map (item: {
            name = ".config/nushell/" + item.name;
            value = {
              force = true;
              recursive = true;
              enable = true;
              source = item.source;
            };
          }) (lib.lists.optionals (cfg.userShell.shell == pkgs.nushell) cfg.userShell.scripts)
        ))
        // (builtins.listToAttrs (
          lib.lists.map (item: {
            name = ".config/zellij/" + item.name;
            value = {
              force = true;
              recursive = true;
              enable = true;
              source = item.source;
            };
          })
          cfg.zellij.layouts
        ))
        // {
          ".cache/zoxide/init.nu" = lib.mkIf (cfg.userShell.shell == pkgs.nushell && cfg.zoxide) {
            source = ./init.nu;
          };
        };
    in {
      file = toHomeFile;
      inherit (settings.home) packages;
    };
  };
}
