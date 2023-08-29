{
  plugins.null-ls = {
    enable = true;
    onAttach = ''function(client, bufnr)
      	if client.supports_method("textDocument/formatting") then
      		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      		vim.api.nvim_create_autocmd("BufWritePre", {
      			buffer = bufnr,
      			callback = function()
      				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
      				vim.lsp.buf.format({
      					async = false,
      					filter = function(client)
      						return client.name ~= "tsserver"
      					end,
      				})
      			end,
      		})
      	end
      end
    '';
    sources.formatting.stylua.enable = true;
    sources.formatting.prettier = {
      enable = true;
      withArgs = ''{filetypes = {
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
        	}},
        	'';
    };
  };
}
