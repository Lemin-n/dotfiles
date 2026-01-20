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
	--[[context_commentstring = {
		enable = true,
	},]]--
})
--require("ts_context_commentstring").setup({})
local parser = require("nvim-treesitter.parsers").get_parser_configs()
parser.tsx.filename_to_parsername = { "javascript", "typescript.tsx" }
parser.http.filename_to_parsername = { "http" }
