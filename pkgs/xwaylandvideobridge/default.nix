{
  stdenv,
  fetchFromGitLab,
  fetchpatch,
  cmake,
  pkg-config,
  extra-cmake-modules,
  qt6,
  kdePackages,
  wrapQtAppsHook,
}:
stdenv.mkDerivation {
  pname = "xwaylandvideobridge";
  version = "unstable-2023-05-28";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "system";
    repo = "xwaylandvideobridge";
    rev = "16091a997d40eb9e5a46f3f0eecceff8fe348c87";
    hash = "sha256-Wzd48cIB/MCbzjBBfdmUfjA43oG0jtg7tWFl91FaDtk=";
  };

  nativeBuildInputs = [cmake extra-cmake-modules pkg-config qt6.wrapQtAppsHook];

  patches = [
    (fetchpatch {
      url = "https://aur.archlinux.org/cgit/aur.git/plain/cursor-mode.patch?h=xwaylandvideobridge-cursor-mode-2-git";
      hash = "sha256-649kCs3Fsz8VCgGpZ952Zgl8txAcTgakLoMusaJQYa4";
    })
  ];

  buildInputs = [
    qt6.qtbase
    #qt6.qtquickcontrols2
    #qt6.qtx11extras
    #qt6
    (kdePackages.kpipewire.overrideAttrs (_oldAttrs: {
      version = "unstable-2025-05-06";

      src = fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "plasma";
        repo = "kpipewire";
        rev = "17a8ad1afa1a92dac723619937ec0cd34eb4b1bc"; # Plasma/5.27 branch
        hash = "sha256-u+CGk/jm5pHTPJYwKHwHc01c9E+ElsfKkzYg5NfIaJ8=";
      };
    }))
  ];
}
