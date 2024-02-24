{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = catppuccin-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./catppuccin.lua;
}
