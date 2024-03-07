{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = rustaceanvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./rustaceanvim.lua;
}
