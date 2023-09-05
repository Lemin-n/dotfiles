{ vimPlugins, ... }:
with vimPlugins;
{
  plugin = copilot-lua;
  type = "lua";
  config = ''
    require("copilot").setup({
    	panel = {
    		enabled = false,
    	},
    	suggestion = {
    		enabled = false,
    	},
    	copilot_node_command = "node",
    	server_opts_overrides = {},
    })
  '';
}
