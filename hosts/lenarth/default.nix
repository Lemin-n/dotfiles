{pkgs, ...}: {
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
    gitname = "Emilio Ruscitti";
    virtManager = true;
    docker = true;
    gitemail = "emiliorccp@gmail.com";
    networking = {
      hostname = "lenarth";
      winbox = true;
    };
    ssh = true;
    gui = true;
    bluetooth = true;
    extraPackages = with pkgs; [
      cargo-flamegraph
      kdePackages.dolphin
      kdePackages.dolphin-plugins
      kdePackages.kio-fuse
      kdePackages.kio-extras
      libsForQt5.qt5ct
      postgresql
    ];
  };
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  #services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    #modesetting.enable = true;
    nvidiaSettings = true;
  };
  nixpkgs.config.allowUnfree = true;
  boot.initrd.systemd.dbus.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  services.postgresql = {
    enable = true;
    ensureDatabases = ["mydatabase"];
    enableTCPIP = true;
    # port = 5432;
    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      local all       all     trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
    initialScript = pkgs.writeText "init" ''
      CREATE ROLE sias_admin WITH LOGIN PASSWORD 'Iso9001' CREATEDB;
      CREATE DATABASE sias;
      GRANT ALL PRIVILEGES ON DATABASE sias TO sias_admin;
    '';
  };

  system.stateVersion = "25.02";
}
