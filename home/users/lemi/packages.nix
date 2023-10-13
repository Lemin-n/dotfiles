{ pkgs
, inputs
, ...
}: {
  home.packages = with pkgs; [
    # Dev-Js
    deno
    nodejs
    # Dev-Rust
    fenix.complete.toolchain
    cargo-leptos
    leptosfmt
    cargo-make
    trunk
    # Dev-php
    php
    php82Packages.composer
    # Dev-go
    go
    # Dev-python
    python3
    # Dev-web
    nodePackages.tailwindcss

    # Social
    telegram-desktop
    discord
    webcord

    # Script
    grim

    # Utils
    jq
    gftp
    image-roll
    neofetch
    felix-fm
    onlyoffice-bin

    # Bluetooth
    blueman

    # Hyprland
    hyprpaper
    hyprpicker

    # Shell-zsh
    zimfw
    # Shell-environment
    zellij

    # Browser
    brave
    # Networking
    seatd

    /*
      zls
      rnix-lsp
      taplo
      alejandra
      lua-language-server
      stylua
      nodePackages.prettier
      nodePackages."@tailwindcss/language-server"
      nodePackages.vscode-html-languageserver-bin
      nodePackages.vscode-css-languageserver-bin
      nodePackages.vscode-json-languageserver
      nodePackages.intelephense
      nodePackages.pyright
      nodePackages.typescript-language-server
      nodePackages.yaml-language-server
    */
  ];
}
