require("nvim-tree").setup({
	sync_root_with_cwd = true,
	view = {
		adaptive_size = true,
		width = 15,
		side = "left",
	},
	diagnostics = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
})
