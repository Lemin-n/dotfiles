{pkgs, ...}: let
  tabby-vim = pkgs.vimUtils.buildVimPlugin {
    pname = "tabby.vim";
    version = "2023-09-21";
    src = pkgs.fetchFromGitHub {
      owner = "TabbyML";
      repo = "vim-tabby";
      rev = "9e537762cbb7647357eab22c61c7c5dda00138dd";
      sha256 = "0wznkhpd3wax8jqw6wa2802x649jv8ph89plz1qwc08ia47lwcfb";
    };
    meta.homepage = "https://github.com/TabbyML/vim-tabby";
  };
  vimPlugins = pkgs.vimPlugins;
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
    nvim-colorizer-lua
    luasnip
    cmp_luasnip
    copilot-cmp
    cmp-nvim-lua
    cmp-nvim-lsp
    lsp-format-nvim
    lspsaga-nvim
    lspkind-nvim
    tabby-vim
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
    (import ./null-ls.nix {inherit vimPlugins;})
    (import ./copilot.nix {inherit vimPlugins;})
    (import ./tree-sitter.nix {inherit vimPlugins pkgs;})
    (import ./autopairs.nix {inherit vimPlugins;})
    (import ./nvim-tree.nix {inherit vimPlugins;})
    (import ./cmp.nix {inherit vimPlugins pkgs;})
    (import ./catppuccin.nix {inherit vimPlugins;})
    ## (import ./harpoon.nix {inherit vimPlugins;})
    (import ./bufferline.nix {inherit vimPlugins;})
    (import ./lualine.nix {inherit vimPlugins;})
    ## (import ./presence.nix {inherit vimPlugins;})
    (import ./rust-tools.nix {inherit vimPlugins;})
    (import ./telescope.nix {inherit vimPlugins;})
    (import ./colorizer-nvim.nix {inherit vimPlugins;})
    (import ./git.nix {inherit vimPlugins;})
    (import ./surround.nix {inherit vimPlugins;})
  ];
}
