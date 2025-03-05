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
	tools = {
		hover_actions = {
			auto_focus = true,
		},
		enable_clippy = true,
	},
	server = {
		on_attach = function()
			vim.lsp.inlay_hint.enable()
		end,
		default_settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				diagnostics = {
					enable = true,
					["inactive-code"] = false,
				},
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
					--extraArgs = { "--no-deps" },
				},
			},
		},
	},
}
