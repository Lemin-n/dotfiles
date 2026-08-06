{ pkgs, ... }: {
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
      pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-wlr
    ];
    config.common = {
      default = "hyprland";
    };
    config.hyprland = {
      default = [
        "gtk"
        "hyprland"
      ];
    };
  };
}
