---@diagnostic disable: undefined-global
require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		noice = true,
		telescope = {
			enabled = true,
			style = "nvchad",
		},
	},
})
vim.cmd.colorscheme("catppuccin")
