{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = lsp-zero-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./cmp.lua;
}
