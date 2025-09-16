{pkgs}: let
  lib = pkgs.lib;
  customFile = with lib;
    types.submodule {
      options = {
        name = mkOption {
          type = types.str;
        };
        source = mkOption {
          type = types.path;
        };
      };
    };
in
  with lib; {
    avahi = mkEnableOption "Enable avahi discovery service";
    printing = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Enable printing service";
          drivers = mkOption {
            type = types.enum [
              gutenprint
              gutenprintBin
              hplipWithPlugin
              hplip
            ];
            default = [
              gutenprint
              gutenprintBin
            ];
          };
          web = mkOption {
            type = types.bool;
            default = true;
          };
        };
      };
      default = {};
    };
    remoteManagement = mkOption {
      type = types.submodule {
        options = {
          anydesk = mkEnableOption "Add AnyDesk to user packages";
          remmina = mkEnableOption "Add Remmina to user packages";
        };
      };
      default = {};
    };
    ssh = mkEnableOption "Enable SSH";
    gui = mkEnableOption "Enable GUI related services";
    bluetooth = mkOption {
      type = types.bool;
      default = true;
    };
    batteryDevice = mkEnableOption "Enable battery monitoring and management services";
    torrent = mkEnableOption "Enable torrent and jackett services";
    ntp = mkEnableOption "Enable NTP Rust based service";
    language = "Enable layout";
    soundBackend = mkOption {
      type = types.enum [
        "pipewire"
        "pulseaudio"
      ];
      default = "pipewire";
    };
    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [];
    };
    groups = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    userShell = mkOption {
      type = types.submodule {
        options = {
          scripts = mkOption {
            type = types.listOf customFile;
          };
          shell = mkOption {
            type = types.enum [
              pkgs.zsh
              pkgs.nushell
            ];
            default = pkgs.zsh;
          };
        };
      };
    };

    networking = mkOption {
      type = types.submodule {
        options = {
          tcpPorts = mkOption {
            type = types.listOf types.int;
            default = [];
          };
          udpPorts = mkOption {
            type = types.listOf types.int;
            default = [];
          };
          hostname = mkOption {
            type = types.nullOr types.str;
            default = null;
          };
          winbox = mkEnableOption "Enable winbox util";
          cloudflared = mkEnableOption "Enable cloudflared util";
          iperf = mkEnableOption "Enable iperf util";
          wireshark = mkEnableOption "Enable wireshark util";
        };
      };
      default = {};
    };

    postgres = mkEnableOption "Enable pg database and utils";
    bat = mkEnableOption "Enable bat util";
    eza = mkEnableOption "Enable eza util";
    starship = mkEnableOption "Enable starship util";
    ripgrep = mkEnableOption "Enable ripgrep util";
    zoxide = mkEnableOption "Enable zoxide util";
    zellij = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Enable zellij util";
          layouts = mkOption {
            type = types.listOf customFile;
          };
        };
      };
    };
    homepath = user:
      mkOption {
        type = types.str;
        default = "/home/${user}";
      };
    normalUser = mkOption {
      type = types.bool;
      default = true;
    };
    gitemail = mkOption {
      type = types.str;
    };
    gitname = mkOption {
      type = types.str;
    };
    virtManager = mkEnableOption "Enable virt manager for this host";
    docker = mkEnableOption "Enable docker for this host";
    touchpad = mkEnableOption "Enable touchpad this host";
    gaming = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Enable gaming packages (Every packet are enabled by default)";
          steam = mkOption {
            type = types.bool;
            default = true;
            description = "Add Steam to user packages";
          };
          heroic = mkOption {
            type = types.bool;
            default = true;
            description = "Add Heroic to user packages";
          };
          retroarch = mkOption {
            type = types.bool;
            default = true;
            description = "Add RetroArch to user packages";
          };
        };
      };
      default = {};
    };
  }
