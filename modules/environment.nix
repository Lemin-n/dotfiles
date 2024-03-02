{pkgs, ...}: {
  environment.sessionVariables = {
    PATH = [
      "$HOME/.cargo/bin/"
      "$HOME/.npm-global/bin"
      "$HOME/.config/script"
    ];

    NIX_LD_LIBRARY_PATH = with pkgs;
      lib.makeLibraryPath [
        libqt5pas
        xorg.libxcb
        xorg.libX11
        libsForQt5.qt5.qtwayland
      ];
    NIX_LD = with pkgs; lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
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
    ouch
  ];
}
