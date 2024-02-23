{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = null-ls-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./null-ls.lua;
}
