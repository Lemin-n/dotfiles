local opts = {
	tools = {
		autoSetHints = true,
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},
	server = Rust_lsp,
}
--require("rust-tools").setup(opts)
require("crates").setup({
	popup = {
		border = "rounded",
		show_version_date = true,
	},
	null_ls = {
		enabled = true,
		name = "crates.nvim",
	},
	src = {
		cmp = {
			enabled = true,
		},
	},
})

vim.g.rustaceanvim = {
	-- Plugin configuration
	--tools = {},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			-- you can also put keymaps in here
		end,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				-- Other Settings ...
				procMacro = {
					ignored = {
						leptos_macro = {
							-- Leptos
							"component",
							"server",
						},
					},
				},
			},
		},
	},
	-- DAP configuration
	--dap = {},
}
