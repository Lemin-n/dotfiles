require("copilot").setup({
	panel = {
		enabled = false,
	},
	suggestion = {
		enabled = false,
	},
	filetypes = {
		rust = false,
		["*"] = true,
	},
	copilot_node_command = "node",
	server_opts_overrides = {},
})
