{
  imports = [
    ./alpha.nix
    ./autopairs.nix
    ./bufferline.nix
    ./cmp.nix
    ./copilot.nix
    ./git.nix
    ./harpoon.nix
    ./lualine.nix
    ./markdown-preview.nix
    ./nvim-tree.nix
    ./presence.nix
    ./telescope.nix
    ./lsp
  ];

  # https://github.com/L3MON4D3/LuaSnip
  # https://nix-community.github.io/nixvim/plugins/luasnip/index.html
  plugins.luasnip.enable = true;

  # https://github.com/tpope/vim-endwise
  # https://nix-community.github.io/nixvim/plugins/endwise.html
  plugins.endwise.enable = true;

  # https://github.com/junegunn/limelight.vim
  # 
  #plugins.limeline.enable = true;

}
