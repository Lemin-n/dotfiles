{
  imports = [ ./rust.nix ];
  plugins.lsp = {
    enable = true;
    servers = {
      rnix-lsp = {
        enable = true;
        cmd = [ "rnix-lsp" ];
        filetypes = [ "nix" ];
      };
      lua-ls.enable = true;
      jsonls.enable = true;
    };
  };
  plugins.lsp-format.enable = true;
  plugins.lspkind.enable = true;
  plugins.lspsaga.enable = true;
}
