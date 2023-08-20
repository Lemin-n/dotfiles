{
  # https://github.com/nvim-telescope/telescope.nvim
  # https://nix-community.github.io/nixvim/plugins/telescope/index.html
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
        fuzzy = true;
      };
    };
  };
}
