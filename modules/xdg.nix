{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    config.common = {
      default = "hyprland";
    };
  };
}
