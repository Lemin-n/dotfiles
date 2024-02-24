---@diagnostic disable: undefined-global
require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		noice = true,
	},
})
vim.cmd.colorscheme("catppuccin")
