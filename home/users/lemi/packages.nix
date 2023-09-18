{ pkgs
, inputs
, ...
}: {
  home.packages = with pkgs; [
    fenix.complete.toolchain
    cargo-leptos
    cargo-make
    brave
    telegram-desktop
    discord
    grim
    jq
    gftp
    image-roll
    webcord
    blueman
    hyprpaper
    hyprpicker
    wofi
    waybar
    neofetch
    zimfw
    felix-fm
    zellij
    alejandra
    trunk
    nodejs
    seatd
    php
    go
    python3
    deno
    rnix-lsp
    lua-language-server
    taplo
    zls
    stylua
    onlyoffice-bin
    php82Packages.composer
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
}
