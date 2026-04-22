{ pkgs, ... }:
{
  imports = [ ./plugins ];
  config = {
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
        # Dev-Rust
        taplo
        leptosfmt
        #rust-analyzer-nightly
        #(fenix.latest.withComponents [
        #"cargo"
        #"clippy"
        #"rustfmt"
        #])

        # Dev-js
        nodejs
        deno
        typescript-language-server
        typescript-language-server
        typescript
        vue-language-server

        # Dev-php
        php
        intelephense

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
        yaml-language-server

        # Dev-Zig
        zls

        # Dev-web
        tailwindcss
        prettier
        #"@tailwindcss/language-server"
        vscode-langservers-extracted
      ];
      viAlias = true;
      vimAlias = true;
      withRuby = false;
      withPython3 = false;

      extraConfig = ''
        set noswapfile
      '';
      # Override vim opt and globals
      # Override Keymaps
      # Mk Preview
      initLua = pkgs.lib.strings.fileContents ./globals.lua;
    };
  };
}
