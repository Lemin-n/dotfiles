{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-wlr];
    config.common = {
      default = "gtk";
    };
  };
}
