{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];
  zenix = {
    username = "lemi";
    configuredShell = {
      userShell = {
        shell = pkgs.nushell;
        scripts = [
          {
            name = "config.nu";
            source = ../../modules/shell/config.nu;
          }
          {
            name = "env.nu";
            source = ../../modules/shell/env.nu;
          }
        ];
      };
      zellij = {
        enable = true;
        layouts = [
          {
            name = "laravel.nu";
            source = ../../modules/shell/laravel-vite.kdl;
          }
          {
            name = "default.kdl";
            source = ../../modules/shell/default.nix;
          }
          {
            name = "config.kdl";
            source = ../../modules/shell/config.kdl;
          }
        ];
      };
      starship = true;
      eza = true;
      ripgrep = true;
      zoxide = true;
      bat = true;
    };
    groups = [
      "wheel"
      "video"
      "docker"
      "networkmanager"
      "wireshark"
      "audio"
      "input"
      "tty"
      "pipewire"
    ];
    gaming.enable = true;
    gitname = "Emilio Ruscitti";
    virtManager = true;
    docker = true;
    networking = {
      hostname = "kalimdar";
      winbox = true;
      iperf = true;
      wireshark = true;
      tcpPorts = [
        5000
        5173
        3030
        8000
      ];
      udpPorts = [
        5000
        3030
        8000
        28013
      ];
    };
    #gaming = true;
    ssh = true;
    gui = true;
    bluetooth = true;
    gitemail = "emiliorccp@gmail.com";
    extraPackages = with pkgs; [
      cargo-flamegraph
      kdePackages.dolphin
      kdePackages.dolphin-plugins
      kdePackages.kio-fuse
      kdePackages.kio-extras
      cifs-utils
      samba
      postgresql
      perf
      zed-editor
      libsForQt5.qt5ct
      google-chrome
    ];
  };

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [
      #pkgs.amdvlk
      pkgs.rocmPackages.clr.icd
    ];
    extraPackages32 = [
      #pkgs.driversi686Linux.amdvlk
    ];
  };
  programs.regreet.enable = true;

  #hardware.amdgpu.amdvlk = {
  #enable = true;
  #support32Bit.enable = true;
  #};
  #services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  environment.variables.AMD_VULKAN_ICD = "RADV";

  environment.etc."hosts".mode = "0644";

  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
  security.pki.certificateFiles = [
    ./zerac-ca.srl
    ./zerac-chain.crt
    ./zerac-server.crt
    ./zerac-ca.key
    ./zerac-ca.crt
    ./zerac-server.key
  ];

  # Load nvidia driver for Xorg and Wayland
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.02";
}
