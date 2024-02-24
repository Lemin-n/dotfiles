{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = nvim-autopairs;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./autopairs.lua;
}
