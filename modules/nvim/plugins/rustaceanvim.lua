--@diagnostic disable: undefined-globals
require("crates").setup({
	popup = {
		border = "rounded",
		show_version_date = true,
	},
	completion = {
		cmp = {
			enabled = true,
		},
		crates = {
			enabled = true,
		},
	},
	null_ls = {
		enabled = true,
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
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
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
}
