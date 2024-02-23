{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = presence-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./presence.lua;
}
