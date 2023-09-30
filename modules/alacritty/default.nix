{ pkgs, ... }:
let
  bell = import ./bell.nix;
  bindings = import ./bindings.nix;
  color = import ./color.nix;
  cursor = import ./cursor.nix;
  font = import ./font.nix;
  hints = import ./hints.nix;
  mouse = import ./mouse.nix;
  window = import ./window.nix;
in
{
  enable = true;
  settings = {
    env.TERM = "xterm-256color";
    selection = {
      save_to_clipboard = true;
    };
    shell = {
      program = "${pkgs.zsh}/bin/zsh";
      args = [ "--login" ];
    };
    ipc_socket = true;
    live_config_reload = true;
    draw_bold_text_with_bright_colors = true;
    inherit bell bindings color cursor font hints mouse window;
  };
}
