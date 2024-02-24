{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = lualine-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./lualine.lua;
}
