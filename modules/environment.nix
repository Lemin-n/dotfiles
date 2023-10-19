{ pkgs, ... }: {
  environment.sessionVariables = rec {
    PATH = [
      "$HOME/.cargo/bin/"
      "$HOME/.npm-global/bin"
    ];
  };
  environment.systemPackages = with pkgs; [
    # Remote and Networking
    anydesk
    winbox

    # Social
    slack

    # Spotify
    spotify-tui
    spotifyd
    spotify

    # Default
    curl
    wget

    # SSL
    openssl
    openssl.dev

    # Windows tools
    ntfs3g

    # Compression
    zip
    unzip
    gnutar

    # Predefined
    # Git
    git
    gitoxide

    # Bluetooth
    bluezFull

    # Utils
    ripgrep
    gcc_multi

    # Xserver
    xdg-utils
    pavucontrol

    # Docker
    docker-compose

    # Font
    font-manager

    #Hyprland
    wev
  ];
}
