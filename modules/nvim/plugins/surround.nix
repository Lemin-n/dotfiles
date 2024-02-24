{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = nvim-surround;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./surround.lua;
}
