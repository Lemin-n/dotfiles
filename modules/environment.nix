{ pkgs, ... }: {
  environment.sessionVariables = rec {
    PATH = [
      "$HOME/.cargo/bin/"
    ];
  };
  environment.systemPackages = with pkgs; [
    git
    anydesk
    slack
    font-manager
    docker-compose
    winbox
    openssl
    openssh
    bluezFull
    pavucontrol
    wev
    ntfs3g
    gitoxide
    xdg-utils
    spotify-tui
    spotifyd
    spotify
    ripgrep
    gcc_multi
    curl
    wget
    openssl
    openssl.dev
    zip
    unzip
    gnutar
  ];
}
