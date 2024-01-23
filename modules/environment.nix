{pkgs, ...}: {
  environment.sessionVariables = {
    PATH = [
      "$HOME/.cargo/bin/"
      "$HOME/.npm-global/bin"
      "$HOME/.config/script"
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
