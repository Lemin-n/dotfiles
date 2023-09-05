{ vimPlugins, ... }:
with vimPlugins;
{
  plugin = bufferline-nvim;
  type = "lua";
  config = ''
    require("bufferline").setup {
      highlights = require("catppuccin.groups.integrations.bufferline").get()
    }
  '';
}
