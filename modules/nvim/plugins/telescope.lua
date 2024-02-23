require("telescope").setup({
	extensions = {
		project = {
			order_by = "asc",
			hidden_files = false,
			search_by = "title",
			sync_with_nvim_tree = true,
		},
	},
})
require("telescope").load_extension("project")
