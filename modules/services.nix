{
  pkgs,
  self',
  ...
}: {
  services = {
    # provide location
    geoclue2.enable = true;
    printing = {
      enable = true;
    };
    xserver = {
      xkb = {
        layout = "
          us ";
        variant = "
          altgr-intl ";
      };
    };
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
      };
    };
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
    upower.enable = true;
    dbus.packages = [pkgs.gcr];
    ratbagd.enable = true;
  };
}
