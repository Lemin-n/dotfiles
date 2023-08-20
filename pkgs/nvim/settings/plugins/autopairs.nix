{
  # https://nix-community.github.io/nixvim/plugins/nvim-autopairs.html
  # https://github.com/windwp/nvim-autopairs
  plugins.nvim-autopairs = {
    checkTs = true;
    enable = true;
  };

  # https://nix-community.github.io/nixvim/plugins/ts-autotag.html
  # https://github.com/windwp/nvim-ts-autotag
  plugins.ts-autotag = {
    enable = true;
  };
}
