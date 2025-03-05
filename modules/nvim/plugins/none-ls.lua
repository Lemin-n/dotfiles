---@diagnostic disable: undefined-global ,redefined-local
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local blgroup = vim.api.nvim_create_augroup("HandlingBlade", {})
vim.api.nvim_create_autocmd("FileType", {
	group = blgroup,
	buffer = bufnr,
	callback = function()
		if string.find(vim.bo.filetype, "%.blade%.") then
			vim.bo.filetype = "blade"
		end
	end,
})
local on_attach = function(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable()
	end
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format({
					async = false,
					filter = function(client)
						return (client.name ~= "tsserver")
					end,
				})
			end,
		})
	end
end
local none_ls = require("null-ls")
none_ls.setup({
	debug = true,
	sources = {
		none_ls.builtins.formatting.stylua,
		none_ls.builtins.formatting.alejandra,
		none_ls.builtins.formatting.leptosfmt,
		none_ls.builtins.formatting.biome,
		none_ls.builtins.formatting.blade_formatter.with({
			filetypes = {
				"blade",
			},
			extra_args = {
				"--sort-classes",
				"--sort-attributes",
				"idiomatic",
				"--ident-inner-html",
				"--no-trailing-comma-php",
				"--no-multiple-empty-lines",
			},
		}),
		none_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"css",
				"vue",
				"scss",
				"html",
				"yaml",
				"markdown",
				"graphql",
				"md",
				"txt",
			},
		}),
	},
	on_attach = on_attach,
})
