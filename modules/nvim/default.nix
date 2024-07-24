{pkgs, ...}: {
  imports = [./plugins];
  config = {
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
        # Dev-Rust
        taplo
        leptosfmt
        fenix.complete.toolchain
        rust-analyzer-nightly

        # Dev-js
        nodejs
        deno
        nodePackages.typescript-language-server
        #volar

        # Dev-php
        php
        nodePackages.intelephense

        # Dev-python
        python3
        pyright

        # Dev-go
        go

        # Dev-Lua
        stylua

        lua-language-server

        # Dev-Nix
        nil
        alejandra

        # Utils
        ripgrep

        # Self-Dif ~ Data Interchange Format
        taplo
        nodePackages.yaml-language-server

        # Dev-Zig
        zls

        # Dev-web
        biome
        nodePackages.tailwindcss
        nodePackages.prettier
        nodePackages."@tailwindcss/language-server"
        vscode-langservers-extracted
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
