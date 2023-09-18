{ pkgs, ... }:
let
  plugins = import ./plugins { inherit (pkgs) vimPlugins; };
in
{
  inherit plugins;
  enable = true;
  extraPackages = with pkgs; [
    nodejs
    php
    go
    python3
    deno
    rnix-lsp
    alejandra
    lua-language-server
    taplo
    ripgrep
    zls
    stylua
    nodePackages.tailwindcss
    nodePackages.prettier
    nodePackages."@tailwindcss/language-server"
    nodePackages.vscode-html-languageserver-bin
    nodePackages.vscode-css-languageserver-bin
    nodePackages.vscode-json-languageserver
    nodePackages.intelephense
    nodePackages.pyright
    nodePackages.typescript-language-server
    nodePackages.yaml-language-server
  ];
  viAlias = true;
  vimAlias = true;
  extraLuaConfig = ''
       vim.o.signcolumn = "yes"
       vim.o.completeopt = "menuone,noinsert,noselect"
       vim.o.shortmess = "filnxtToOFc"
       vim.o.mapleader = ","
       vim.o.number = true
       vim.o.updatetime = 100
       vim.o.rnu = true
       vim.o.mouse = "a"
       vim.o.scrolloff = 3
       vim.g.rustfmt_autosave = 1
       vim.g.mapleader = ","
       vim.g.syntax = "off"
       vim.diagnostic.config({
       	update_in_insert = true,
       })
       function keymap(maptype, keybind, binding, mode)
       	mode = mode or { nowait = true, silent = true, noremap = true }
       	vim.api.nvim_set_keymap(maptype, keybind, "<cmd>" .. binding .. "<CR>", mode)
       end
       vim.api.nvim_create_autocmd({ "CursorHold" }, {
    callback = function()
    	vim.diagnostic.open_float(nil, { focuseable = false })
    end
       })
       keymap("n", "<leader>th", ":botright new <Bar> :terminal")
       keymap("n", "<leader>ts", ":botright vnew <Bar> :terminal")
       keymap("n", "<leader>tg", ":lua require('telescope.builtin').live_grep()")
       -- Markdown preview options
       vim.g.mkdp_open_to_the_world = 1
       vim.g.mkdp_open_ip = "192.168.0.194"
       vim.g.mkdp_echo_preview_url = 1
       vim.g.mkdp_port = 9808
       vim.g.mkdp_theme = "dark"
  '';
}
