{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = harpoon;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./harpoon.lua;
}
