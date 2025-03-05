{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = lsp-zero-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./cmp.lua + "

lsp.volar.setup({})
lsp.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '${pkgs.vue-language-server}/lib/node_modules/@vue/language-server',
        languages = { 'vue', 'javascript', 'typescript' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  on_attach = function(client)
  	client.server_capabilities.documentFormattingProvider = false
  end,
})
lsp_zero.setup()
";
}
