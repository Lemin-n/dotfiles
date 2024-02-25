{pkgs, ...}: {
  imports = [./plugins];
  config = {
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
        # Dev-Rust
        taplo
        leptosfmt

        # Dev-js
        nodejs
        deno
        nodePackages.typescript-language-server
        nodePackages.volar

        # Dev-php
        php
        nodePackages.intelephense

        # Dev-python
        python3
        nodePackages.pyright

        # Dev-go
        go

        # Dev-Lua
        stylua

        lua-language-server

        # Dev-Nix
        rnix-lsp
        nil
        alejandra

        # Utils
        ripgrep

        # Self-Dif ~ Data Interchange Format
        nodePackages.vscode-json-languageserver
        taplo
        nodePackages.yaml-language-server

        # Dev-Zig
        zls

        # Dev-web
        biome
        nodePackages.tailwindcss
        nodePackages.prettier
        nodePackages."@tailwindcss/language-server"
        nodePackages.vscode-html-languageserver-bin
        nodePackages.vscode-css-languageserver-bin
      ];
      viAlias = true;
      vimAlias = true;
      extraConfig = ''
        set noswapfile
      '';
      # Override vim opt and globals
      # Override Keymaps
      # Mk Preview
      extraLuaConfig = pkgs.lib.strings.fileContents ./globals.lua;
    };
  };
}
