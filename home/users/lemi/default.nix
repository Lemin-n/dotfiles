{ pkgs
, inputs
, ...
}: {
  imports = [
    ./packages.nix
    ./programs.nix
  ];
  home = {
    stateVersion = "23.05";
    username = "lemi";
    homeDirectory = "/home/lemi";
  };
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.fenix.overlays.default ];
  wayland.windowManager.hyprland = import ../../../modules/hyprland;
}
