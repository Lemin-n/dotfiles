{
  pkgs,
  config,
  ...
}: let
  zenixPrograms = config.zenixPrograms;
in {
  options.zenixPrograms = with pkgs.lib; {
    light = mkEnableOption "Enable light backlight manager for this host";
    hyprland = mkEnableOption "Enable hyprland for this host";
    virtManager = mkEnableOption "Enable virt manager for this host";
  };
  config = {
    programs = {
      hyprland = pkgs.lib.attrsets.optionalAttrs zenixPrograms.hyprland {
        enable = true;
        xwayland.enable = true;
        portalPackage = pkgs.xdg-desktop-portal-hyprland;
      };
      light = pkgs.lib.attrsets.optionalAttrs zenixPrograms.light {
        enable = true;
      };
      virt-manager.enable = zenixPrograms.virtManager;
    };
  };
}
