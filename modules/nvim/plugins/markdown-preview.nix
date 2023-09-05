{ vimPlugins, ... }:
with vimPlugins;
{
  plugin = markdown-preview-nvim;
  type = "lua";
  config = ''
    vim.fn['mkdp#util#install']()
  '';
}
