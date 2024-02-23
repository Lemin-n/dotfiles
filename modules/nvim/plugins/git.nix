{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = fugitive;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./git.lua;
}
