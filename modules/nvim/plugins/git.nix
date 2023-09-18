{ vimPlugins, ... }:
with vimPlugins;
{
  plugin = fugitive;
  type = "lua";
  config = ''
  '';
}
