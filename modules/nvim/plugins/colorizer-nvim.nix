{vimPlugins,...}:
with vimPlugins;
{
	plugin = nvim-colorizer-lua;
	type = "lua";
	config = ''
		require'colorizer'.setup()
		'';
}
