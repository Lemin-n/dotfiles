{pkgs, ...}: {
  environment.sessionVariables = rec {
    PATH = [
      "$HOME/.cargo/bin/"
      "$HOME/.npm-global/bin"
    ];
  };
  environment.systemPackages = with pkgs; [
    # Default
    curl
    ripgrep
    git
    wget
    pkg-config
    openssl
    ntfs3g
    zip
    unzip
    gnutar
  ];
}
