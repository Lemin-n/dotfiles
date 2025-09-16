{
  pkgs,
  config,
  ...
}: {
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
      libsForQt5.qt5ct
      google-chrome
    ];
  };

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [pkgs.amdvlk];
    extraPackages32 = [pkgs.driversi686Linux.amdvlk];
  };
  hardware.amdgpu.amdvlk = {
    enable = true;
    support32Bit.enable = true;
  };

  environment.variables.AMD_VULKAN_ICD = "RADV";

  environment.systemPackages = with pkgs; [lact];
  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  # Load nvidia driver for Xorg and Wayland
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.02";
}
