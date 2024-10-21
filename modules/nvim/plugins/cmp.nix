{pkgs, ...}:
with pkgs.vimPlugins; {
  plugin = lsp-zero-nvim;
  type = "lua";
  config = pkgs.lib.strings.fileContents ./cmp.lua + "
lsp.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '${pkgs.lib.getExe pkgs.vue-language-server}',
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
  on_attach = function(client)
  	client.server_capabilities.documentFormattingProvider = false
  end,
})
lsp.volar.setup({
  filetypes = { 'vue' },
  cmd = { '${pkgs.lib.getExe pkgs.vue-language-server}', '--stdio' },
  init_options = {
    typescript = {
      tsdk = '${pkgs.typescript}/lib/node_modules/typescript/lib',
   },
    vue = {
      hybridMode = true,
    },
  },
})
lsp_zero.setup()
";
}
