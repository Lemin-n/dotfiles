{ vimPlugins, ... }:
with vimPlugins;
[
  nvim-ts-context-commentstring
  cmp-treesitter
  nvim-notify
  cmp-conventionalcommits
  cmp-npm
  cmp-git
  cmp-path
  cmp-emoji
  cmp-vsnip
  copilot-cmp
  cmp-nvim-lua
  cmp-nvim-lsp
  vim-vsnip-integ
  lsp-format-nvim
  lspsaga-nvim
  lspkind-nvim
  nvim-lspconfig
  crates-nvim
  plenary-nvim
  nvim-web-devicons
  telescope-project-nvim
  nvim-ts-autotag
  nvim-treesitter-endwise
  inc-rename-nvim
  (import ./null-ls.nix { inherit vimPlugins; })
  (import ./copilot.nix { inherit vimPlugins; })
  (import ./tree-sitter.nix { inherit vimPlugins; })
  (import ./autopairs.nix { inherit vimPlugins; })
  (import ./nvim-tree.nix { inherit vimPlugins; })
  (import ./cmp.nix { inherit vimPlugins; })
  (import ./catppuccin.nix { inherit vimPlugins; })
  (import ./harpoon.nix { inherit vimPlugins; })
  (import ./bufferline.nix { inherit vimPlugins; })
  (import ./lualine.nix { inherit vimPlugins; })
  (import ./presence.nix { inherit vimPlugins; })
  (import ./rust-tools.nix { inherit vimPlugins; })
  (import ./telescope.nix { inherit vimPlugins; })
  (import ./colorizer-nvim.nix { inherit vimPlugins; })
  (import ./git.nix { inherit vimPlugins; })
  (import ./surround.nix { inherit vimPlugins; })
]

