require("telescope").setup({
	extensions = {
		project = {
			order_by = "asc",
			hidden_files = false,
			search_by = "title",
			sync_with_nvim_tree = true,
		},
		file_browser = {
			depth = false,
			theme = "fd",
			select_buffer = true,
			collapse_dirs = true,
			hide_parent_dir = true,
			dir_icon = "",
			dir_icon_hl = "TelescopeNormal",
			hijack_netrw = true,
		},
	},
})
local function get_fd(opts)
	opts = opts or {}

	local theme_opts = {

		theme = "fd",
		layout_config = {
			width = 0.8,
			height = 0.8,
			prompt_position = "top",
		},
		prompt_prefix = "File name : ",
		prompt_title = false,
		results_title = vim.loop.cwd(),
		preview_title = "Preview",
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
	}

	return vim.tbl_deep_extend("force", theme_opts, opts)
end

require("telescope.themes").get_fd = get_fd
require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")
