{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = bufferline-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./bufferline.lua;
}
