{
  # https://github.com/hrsh7th/cmp-nvim-lsp
  # https://nix-community.github.io/nixvim/plugins/cmp-nvim-lsp.html
  plugins.cmp-nvim-lsp.enable = true;

  # https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
  # https://nix-community.github.io/nixvim/plugins/cmp-nvim-lsp-document-symbol.html
  plugins.cmp-nvim-lsp-document-symbol.enable = true;

  # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
  # https://nix-community.github.io/nixvim/plugins/cmp-nvim-lsp-signature-help.html
  plugins.cmp-nvim-lsp-signature-help.enable = true;

  # https://github.com/hrsh7th/cmp-buffer
  # https://nix-community.github.io/nixvim/plugins/cmp-buffer.html
  plugins.cmp-buffer.enable = true;

  # https://github.com/hrsh7th/cmp-vsnip
  # https://nix-community.github.io/nixvim/plugins/cmp-vsnip.html
  plugins.cmp-vsnip.enable = true;

  # https://github.com/saadparwaiz1/cmp_luasnip
  # https://nix-community.github.io/nixvim/plugins/cmp_luasnip.html
  plugins.cmp_luasnip.enable = true;

  # https://github.com/zbirenbaum/copilot-cmp
  # https://nix-community.github.io/nixvim/plugins/copilot-cmp.html
  #plugins.copilot-cmp = {
  #  enable = true;
  #  fixPairs = true;
  #};

  # https://nix-community.github.io/nixvim/plugins/cmp-path.html
  # https://github.com/hrsh7th/cmp-path
  plugins.cmp-path.enable = true;

  # https://github.com/davidsierradz/cmp-conventionalcommits
  # https://nix-community.github.io/nixvim/plugins/cmp-conventionalcommits.html
  plugins.cmp-conventionalcommits.enable = true;

  # https://github.com/hrsh7th/cmp-emoji
  # https://nix-community.github.io/nixvim/plugins/cmp-emoji.html
  plugins.cmp-emoji.enable = true;

  # https://github.com/David-Kunz/cmp-npm
  # https://nix-community.github.io/nixvim/plugins/cmp-npm.html
  plugins.cmp-npm.enable = true;

  # https://github.com/hrsh7th/cmp-nvim-lua
  # https://nix-community.github.io/nixvim/plugins/cmp-nvim-lua.html
  plugins.cmp-nvim-lua.enable = true;

  # https://github.com/hrsh7th/nvim-cmp
  # https://nix-community.github.io/nixvim/plugins/nvim-cmp/index.html
  plugins.nvim-cmp = {
    enable = true;
    autoEnableSources = true;
    completion = {
      completeopt = "menu,menuone,noselect";
      keywordLength = 2;
    };
    mapping =
      {
        "<C-up>" = "cmp.mapping.select_prev_item()";
        "<C-down>" = "cmp.mapping.select_next_item()";
        "<S-Tab>" = "cmp.mapping.select_prev_item ()";
        "<Tab>" = "cmp.mapping.select_next_item()";
        "<S-up>" = "cmp.mapping.scroll_docs(-4)";
        "<S-down>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<CR>" = "cmp.mapping.confirm ({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
      };
    snippet.expand = {
      __raw = ''
        function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
      '';

    };
    sources = [
      {
        name = "path";
        priority = 2;
      }
      {
        name = "nvim_lsp";
        priority = 1;
      }
      {
        name = "vsnip";
        priority = 10;
      }
      {
        name = "copilot";
        priority = 13;
        groupIndex = 1;
      }
      {
        name = "buffer";
        keywordLength = 2;
        priority = 5;
      }
      {
        name = "crates";
        priority = 11;
      }
    ];
  };
}
