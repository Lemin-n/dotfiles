{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = lsp-zero-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./cmp.lua + "
lsp.tsserver.setup({
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '${pkgs.lib.getExe pkgs.vue-language-server}',
        languages = { 'vue' },
      },
    },
  },
  on_attach = function(client)
	client.server_capabilities.documentFormattingProvider = false
  end,
})
lsp.volar.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  cmd = { '${pkgs.lib.getExe pkgs.vue-language-server}', '--stdio' },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
})
lsp_zero.setup()
";
}
