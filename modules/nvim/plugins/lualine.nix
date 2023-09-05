{ vimPlugins, ... }:
with vimPlugins;{
  plugin = lualine-nvim;
  type = "lua";
  config = ''
    require('lualine').setup({
     options = {
            theme = "catppuccin"
        }
    })
  '';
}
