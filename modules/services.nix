
{
  pkgs,
  self',
  ...
}:

{
services = {
    # provide location
    geoclue2.enable = true;

    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;

      # see https://github.com/fufexan/nix-gaming/#pipewire-low-latency
      # lowLatency.enable = true;
    };

    # battery info & stuff
    # upower.enable = true;

    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = [pkgs.gcr];

    ratbagd.enable = true;
  };

}
