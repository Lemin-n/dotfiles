{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = telescope-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./telescope.lua;
}
