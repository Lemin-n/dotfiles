{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = rust-tools-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./rust-tools.lua;
}
