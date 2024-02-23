{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = none-ls-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./none-ls.lua;
}
