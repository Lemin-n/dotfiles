---@diagnostic disable: undefined-global
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
ls.add_snippets("vue", { s("template", { t("<template>"), i(1), t("</template>") }) })
ls.add_snippets("vue", { s("style", { t("<style>"), i(1), t("</style>") }) })
ls.add_snippets("vue", { s("script", { t("<script>"), i(1), t("</script>") }) })
vim.o.signcolumn = "yes"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = "filnxtToOFc"
vim.g.mapleader = ","
vim.o.number = true
vim.o.updatetime = 100
vim.o.rnu = true
vim.o.mouse = "a"
vim.o.scrolloff = 3
--vim.g.rustfmt_autosave = 1
vim.g.skip_ts_context_commentstring_module = true
vim.g.syntax = "off"
vim.diagnostic.config({
	update_in_insert = true,
})

vim.diagnostic.config({
	virtual_text = true,
})

--- Keymap setter
local function keymap(maptype, keybind, binding_arg, mode_arg)
	local mode = {}

	mode["nowait"] = true
	mode["silent"] = true
	mode["noremap"] = true

	if mode_arg ~= {} then
		mode_arg = {}
	end

	for key, value in pairs(mode_arg) do
		t1[key] = value
	end

	local binding = ""

	if binding_arg ~= "" then
		binding = "<cmd>" .. binding_arg .. "<CR>"
	end

	vim.api.nvim_set_keymap(maptype, keybind, binding, mode)
end

vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		vim.cmd(":Lspsaga show_buf_diagnostics ++unfocus")
	end,
})

--[[
trouble
local float_opts = {
	modes = {
		myDiags = {
			mode = "diagnostics",
			preview = {
				type = "float",
				relative = "cursor",
				size = { width = 0.4, height = 0.4 },
			},
		},
	},
}

local trouble = require("trouble")
trouble.setup(float_opts)
local trouble_base = ":Trouble diagnostics toggle win.type =float win.relative=cursor focus=true"
local filter_current = " filter.buf=0 "
local filter_errors = " filter.severity=vim.diagnostic.severity.ERROR "
local filter_warns = " filter.severity=vim.diagnostic.severity.WARN "
keymap("n", "<leader>la", trouble_base)
keymap("n", "<leader>lw", trouble_base .. filter_warns)
keymap("n", "<leader>lc", trouble_base .. filter_current)
keymap("n", "<leader>le", trouble_base .. filter_errors)
keymap("n", "<leader>lec", trouble_base .. filter_errors .. filter_current)
]]
--
keymap("n", "<leader>th", ":botright new <Bar> :terminal")
keymap("n", "<leader>ts", ":botright vnew <Bar> :terminal")

keymap("n", "<leader>lc", ":Lspsaga code_action")
keymap("n", "<leader>lh", ":Lspsaga hover_doc")
keymap("n", "<leader>e", ":Lspsaga rename")
keymap("n", "<leader>lw", ":Lspsaga show_workspace_diagnostics")
keymap("n", "<leader>lb", ":Lspsaga show_buf_diagnostics")

keymap("n", "<leader>b", ":bprev")
keymap("n", "<leader>n", ":bnext")

keymap("n", "<leader>dt", ":DBUIToggle")
keymap("n", "<leader>dr", ":DBUIRenameBuffer")
keymap("n", "<leader>di", ":DBUILastQueryInfo")

keymap("n", "<leader>tg", ":Telescope live_grep")
keymap("n", "<leader>tf", ":Telescope find_files")
keymap("n", "<leader>tb", ":Telescope file_browser")

-- Markdown preview options
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_open_ip = "0.0.0.0"
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_port = 9808
vim.g.mkdp_theme = "dark"

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "sql" },
	callback = function()
		vim.cmd("setlocal omnifunc=vim_dadbod_completion#omni")
	end,
})
vim.g.completion_chain_complete_list = {
	sql = {
		{ complete_items = { "vim-dadbod-completion" } },
	},
}

vim.g.completion_matching_ignore_case = 1
vim.g.completion_matching_strategy_list = { "exact", "substring" }
