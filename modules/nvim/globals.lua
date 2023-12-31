vim.o.signcolumn = "yes"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = "filnxtToOFc"
vim.o.mapleader = ","
vim.o.number = true
vim.o.updatetime = 100
vim.o.rnu = true
vim.o.mouse = "a"
vim.o.scrolloff = 3
vim.g.rustfmt_autosave = 1
vim.g.mapleader = ","
vim.g.skip_ts_context_commentstring_module = true
vim.g.syntax = "off"
vim.diagnostic.config({
	update_in_insert = true,
})
--- Keymap setter
local function keymap(maptype, keybind, binding, mode)
	mode = mode or { nowait = true, silent = true, noremap = true }
	vim.api.nvim_set_keymap(maptype, keybind, "<cmd>" .. binding .. "<CR>", mode)
end

vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		vim.cmd(":Lspsaga show_line_diagnostics ++unfocus")
	end,
})
keymap("n", "<leader>th", ":botright new <Bar> :terminal")
keymap("n", "<leader>ts", ":botright vnew <Bar> :terminal")
keymap("n", "<leader>tg", ":Telescope live_grep")
keymap("n", "<leader>tf", ":Telescope find_files")
keymap("n", "<leader>xr", "<Plug>RestNvim")
-- Markdown preview options
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_open_ip = "0.0.0.0"
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_port = 9808
vim.g.mkdp_theme = "dark"
