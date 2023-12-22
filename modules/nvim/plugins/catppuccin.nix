{vimPlugins, ...}:
with vimPlugins; {
  plugin = catppuccin-nvim;
  type = "lua";
  config = ''
          require('catppuccin').setup({
          flavour = 'mocha',
          transparent_background =true,
          integrations = {
    noice = true,
          },
          })
          vim.cmd.colorscheme "catppuccin"
  '';
}
