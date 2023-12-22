{pkgs, ...}: {
  environment.sessionVariables = rec {
    PATH = [
      "$HOME/.cargo/bin/"
      "$HOME/.npm-global/bin"
    ];
  };
  environment.systemPackages = with pkgs; [
    wl-clipboard
    google-chrome
    carapace
    spot
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
    pkg-config

    # SSL
    openssl
    openssl.dev

    # Windows tools
    ntfs3g

    # Compression
    zip
    unzip
    gnutar
    dbeaver

    # Predefined
    # Git
    git
    gitoxide

    # Bluetooth
    bluez

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
