{ vimPlugins, ... }:
with vimPlugins; {
  plugin = null-ls-nvim;
  type = "lua";
  config = ''
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local on_attach = function(client, bufnr)
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
    						return (client.name ~= "tsserver") or (client.name ~= "intelephense")
    					end,
    				})
    			end,
    		})
    	end
    end
    local null_ls = require("null-ls")
    null_ls.setup({
     debug = true,
    	sources = {
    		null_ls.builtins.formatting.stylua,
    		null_ls.builtins.formatting.alejandra,
    		null_ls.builtins.formatting.blade_formatter.with({
        extra_args = {
     "--sort-tailwindcss-classes",
     "--sort-html-attributes",
     "idiomatic",
     "--tailwindcss-config-path",
     "tailwind.config.js",
     "--no-trailing-comma-php",
     "--no-single-quote",
     "--no-multiple-empty-lines",
        },
    }),
    		null_ls.builtins.formatting.prettier.with({
    			filetypes = {
    				"javascript",
    				"typescript",
    				"javascriptreact",
    				"typescriptreact",
    				"css",
    				"scss",
    				"html",
    				"json",
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
  '';
}
