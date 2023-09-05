{ vimPlugins, ... }:
with vimPlugins;
{
  plugin = nvim-autopairs;
  type = "lua";
  config = ''
    	local npairs = require('nvim-autopairs')
    	local Rule = require('nvim-autopairs.rule')
    	npairs.setup({check_ts = true})
    	local ts_conds = require('nvim-autopairs.ts-conds')
    	npairs.add_rules({
    		Rule('<', '>', 'rust'):with_pair(ts_conds.is_not_ts_node({'Conditional'})),
    	})
    	'';
}
