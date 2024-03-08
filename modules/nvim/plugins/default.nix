{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-ts-context-commentstring
    cmp-treesitter
    nvim-notify
    cmp-conventionalcommits
    cmp-npm
    cmp-git
    cmp-path
    cmp-emoji
    gitsigns-nvim
    nvim-colorizer-lua
    luasnip
    cmp_luasnip
    #copilot-cmp
    cmp-nvim-lua
    nvim-dap
    lsp-inlayhints-nvim
    cmp-nvim-lsp
    lsp-format-nvim
    lspsaga-nvim
    lspkind-nvim
    #tabby-vim
    markdown-preview-nvim
    nvim-lspconfig
    crates-nvim
    plenary-nvim
    nvim-web-devicons
    telescope-project-nvim
    nvim-ts-autotag
    nvim-treesitter-endwise
    inc-rename-nvim
    rest-nvim
    #(import ./copilot.nix {inherit pkgs;})
    (import ./tree-sitter.nix {inherit pkgs;})
    (import ./autopairs.nix {inherit pkgs;})
    (import ./nvim-tree.nix {inherit pkgs;})
    (import ./cmp.nix {inherit pkgs;})
    (import ./none-ls.nix {inherit pkgs;})
    (import ./catppuccin.nix {inherit pkgs;})
    ## (import ./harpoon.nix {inherit pkgs;})
    (import ./bufferline.nix {inherit pkgs;})
    (import ./lualine.nix {inherit pkgs;})
    ## (import ./presence.nix {inherit pkgs;})
    (import ./rustaceanvim.nix {inherit pkgs;})
    (import ./telescope.nix {inherit pkgs;})
    (import ./colorizer-nvim.nix {inherit pkgs;})
    (import ./git.nix {inherit pkgs;})
    (import ./surround.nix {inherit pkgs;})
  ];
}
