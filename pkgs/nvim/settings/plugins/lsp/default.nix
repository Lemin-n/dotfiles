{
  imports = [ ./rust.nix ./null-ls.nix ];
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
      pyright.enable = true;
      tailwindcss.enable = true;
      tsserver.enable = true;
    };
  };
  plugins.lsp-format.enable = true;
  plugins.lspkind.enable = true;
  plugins.lspsaga.enable = true;

  # https://nix-community.github.io/nixvim/plugins/nix.html
  plugins.nix.enable = true;

  # https://github.com/ziglang/zig.vim
  # https://nix-community.github.io/nixvim/plugins/zig.html
  plugins.zig.enable = true;
}
