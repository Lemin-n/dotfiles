{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = nvim-tree-lua;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./nvim-tree.lua;
}
