{
  vimPlugins,
  pkgs,
  ...
}:
with vimPlugins; {
  plugin = nvim-treesitter.withAllGrammars;
  type = "lua";

  config = pkgs.lib.strings.fileContents ./tree-sitter.lua;
}
