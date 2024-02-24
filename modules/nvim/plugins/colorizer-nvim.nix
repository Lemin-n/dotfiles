{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = nvim-colorizer-lua;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./colorizer-nvim.lua;
}
