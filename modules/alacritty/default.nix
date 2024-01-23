{
  lib,
  pkgs,
  config,
  ...
}: let
  bell = import ./bell.nix;
  bindings = import ./bindings.nix;
  color = import ./color.nix;
  cursor = import ./cursor.nix;
  font = import ./font.nix;
  hints = import ./hints.nix;
  mouse = import ./mouse.nix;
  window = import ./window.nix;
  cfg = config.alacritty;
in
  with lib; {
    options.alacritty = {
      enable = mkEnableOption "Enable alacritty";
      name = mkOption {
        type = types.str;
      };
      shell = mkOption {
        type = types.enum [pkgs.zsh pkgs.nushell];
      };
    };

    config = let
      selectedShell =
        if cfg.shell == pkgs.zsh
        then "zsh"
        else "nu";
      shellArgs = ["options" "--default-shell" selectedShell];
    in
      mkIf cfg.enable {
        programs.alacritty = {
          enable = true;
          settings = {
            env.TERM = "xterm-256color";
            selection = {
              save_to_clipboard = true;
            };
            shell = {
              program = lib.meta.getExe pkgs.zellij;

              args = shellArgs;
            };
            ipc_socket = true;
            live_config_reload = true;
            inherit bell bindings color cursor font hints mouse window;
          };
        };
      };
  }
