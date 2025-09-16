{
  pkgs,
  self',
  config,
  ...
}: let
  cfg = config.zenvices;
  lib = pkgs.lib;
  modules = import ./options.nix {inherit pkgs;};
in {
  options.zenvices = {
    avahi = modules.avahi;
    printing = modules.printing;
    ssh = modules.ssh;
    gui = modules.gui;
    batteryDevice = modules.batteryDevice;
    torrent = modules.torrent;
    ntp = modules.ntp;
    soundBackend = modules.soundBackend;
  };
  config = {
    services = {
      avahi = lib.mkIf cfg.avahi {
        enable = true;
        nssmdns4 = true;
      };
      printing = lib.mkIf cfg.printing.enable {
        enable = cfg.printing.enable;
        drivers = cfg.printing.drivers;
        webInterface = cfg.printing.web;
      };

      xserver = {
        xkb = {
          layout = "
          us ";
          variant = "
          altgr-intl ";
        };
      };
      openssh = lib.mkIf cfg.ssh {
        enable = cfg.ssh;
        settings = {
          PasswordAuthentication = true;
          PermitRootLogin = "no";
        };
      };
      gnome.gnome-keyring = lib.mkIf cfg.gui {enable = true;};
      upower = lib.mkIf cfg.batteryDevice {enable = true;};
      dbus = {
        apparmor = "enabled";
        implementation = "broker";
      };
      ntpd-rs = lib.mkIf cfg.ntp {
        enable = true;
        useNetworkingTimeServers = true;
      };
      jackett = lib.mkIf cfg.torrent {
        enable = true;
        dataDir = "/home/jackett";
        openFirewall = true;
      };
    };
  };
}
