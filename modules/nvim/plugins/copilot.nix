{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = copilot-lua;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./copilot.lua;
}
