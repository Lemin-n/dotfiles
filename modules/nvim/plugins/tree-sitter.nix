{ vimPlugins, ... }:
with vimPlugins;
{

  plugin = nvim-treesitter.withAllGrammars;
  type = "lua";

  config = ''
    require("nvim-treesitter.configs").setup({
    	highlight = {
    		enable = true,
    		additional_vim_regex_highlighting = false,
    	},
    	indent = {
    		enable = true,
    	},
    	autotag = {
    		enable = true,
    		filetype = { "html", "typescriptreact", "javascriptreact" },
    	},
    context_commentstring = {
    		enable = true,
    },
    })
    local parser = require("nvim-treesitter.parsers").get_parser_configs()
    parser.tsx.filename_to_parsername = { "javascript", "typescript.tsx" }
  '';
}
