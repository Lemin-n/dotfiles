{ pkgs
, inputs
, ...
}: {
  home.packages = with pkgs; [
    fenix.complete.toolchain
    cargo-leptos
    leptosfmt
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
    neofetch
    zimfw
    felix-fm
    zellij
    trunk
    nodejs
    seatd
    php
    go
    python3
    deno
    onlyoffice-bin
    php82Packages.composer
    nodePackages.tailwindcss
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
