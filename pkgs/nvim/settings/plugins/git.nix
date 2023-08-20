{
  # https://github.com/tpope/vim-fugitive
  # https://nix-community.github.io/nixvim/plugins/fugitive.html
  plugins.fugitive.enable = true;

  # https://github.com/rhysd/git-messenger.vim
  # https://nix-community.github.io/nixvim/plugins/gitmessenger.html
  plugins.gitmessenger = {
    enable = true;
    alwaysIntoPopup = true;
    gitCommand = "gix";
  };

  # https://github.com/NeogitOrg/neogit
  # https://nix-community.github.io/nixvim/plugins/neogit/index.html
  plugins.neogit.enable = true;
}
