{ vimPlugins, ... }:
with vimPlugins;
{
  plugin = nvim-surround;
  type = "lua";
  config = "require('nvim-surround').setup()";
}
