{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = markdown-preview-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./markdown-preview.lua;
}
