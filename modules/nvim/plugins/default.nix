{pkgs, ...}: let
  #tabby-vim = pkgs.vimUtils.buildVimPlugin {
  #pname = "tabby.vim";
  #version = "2023-09-21";
  #src = pkgs.fetchFromGitHub {
  #owner = "TabbyML";
  #repo = "vim-tabby";
  #rev = "9e537762cbb7647357eab22c61c7c5dda00138dd";
  #sha256 = "0wznkhpd3wax8jqw6wa2802x649jv8ph89plz1qwc08ia47lwcfb";
  #};
  #meta.homepage = "https://github.com/TabbyML/vim-tabby";
  #};
in {
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
    copilot-cmp
    cmp-nvim-lua
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
    (import ./none-ls.nix {inherit pkgs;})
    (import ./copilot.nix {inherit pkgs;})
    (import ./tree-sitter.nix {inherit pkgs;})
    (import ./autopairs.nix {inherit pkgs;})
    (import ./nvim-tree.nix {inherit pkgs;})
    (import ./cmp.nix {inherit pkgs;})
    (import ./catppuccin.nix {inherit pkgs;})
    ## (import ./harpoon.nix {inherit pkgs;})
    (import ./bufferline.nix {inherit pkgs;})
    (import ./lualine.nix {inherit pkgs;})
    ## (import ./presence.nix {inherit pkgs;})
    (import ./rust-tools.nix {inherit pkgs;})
    (import ./telescope.nix {inherit pkgs;})
    (import ./colorizer-nvim.nix {inherit pkgs;})
    (import ./git.nix {inherit pkgs;})
    (import ./surround.nix {inherit pkgs;})
  ];
}
