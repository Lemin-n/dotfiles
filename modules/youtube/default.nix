{
  pkgs,
  config,
  ...
}: let
  cfg = config.zentube;
  tui-pkgs = with pkgs; lib.lists.optionals cfg.tui [youtube-tui youtube-dl-light libsixel mpv-unwrapped];
  music-pkgs = with pkgs; lib.lists.optional cfg.music youtube-music;
  youtube-packages = with pkgs.lib.lists; flatten [tui-pkgs music-pkgs];
  zentube-options = import ./module.nix (pkgs.lib);
in {
  options.zentube =
    zentube-options;

  config = {
    home.packages = youtube-packages;
  };
}
