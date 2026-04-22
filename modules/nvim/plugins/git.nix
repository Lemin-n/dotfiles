{ pkgs, ... }:
with pkgs.vimPlugins;
{
  plugin = vim-fugitive;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./git.lua;
}
