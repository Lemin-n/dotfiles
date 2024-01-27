{pkgs, ...}: {
  environment.sessionVariables = {
    PATH = [
      "$HOME/.cargo/bin/"
      "$HOME/.npm-global/bin"
      "$HOME/.config/script"
    ];
  };
  powerManagement.cpuFreqGovernor = "ondemand";
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
