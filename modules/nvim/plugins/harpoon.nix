{ vimPlugins, ... }:
with vimPlugins;
{
  plugin = harpoon;
  type = "lua";
  config = ''
    	require("harpoon").setup({})
  '';
}
