--local opts = {
--	tools = {
--		autoSetHints = true,
--		runnables = {
--			use_telescope = true,
--		},
--		inlay_hints = {
--			parameter_hints_prefix = "",
--			other_hints_prefix = "",
--		},
--	},
--	server = Rust_lsp,
--}
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
	inlay_hints = {
		highlight = "NonText",
	},
	tools = {
		hover_actions = {
			auto_focus = true,
		},
		enable_clippy = true,
	},
	server = {
		on_attach = function(client, bufnr)
			require("lsp-inlayhints").on_attach(client, bufnr)
		end,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				-- Add clippy lints for Rust.
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
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
