{
  pkgs,
  config,
  ...
}: let
  cfg = config.zentube;
  youtube-packages = with pkgs.lib.list; flatten [optionals cfg.tui [youtube-tui youtube-dl-light libsixel mpv-unwrapped] optionals cfg.music [youtube-music]];
in {
  options.zentube = with pkgs.lib; {
    enable = mkOptionEnable "Enable Zentube packages";
    tui = mkOption {
      type = types.bool;
      default = true;
    };
    music = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = pkgs.lib.mkIf cfg.enable {
    home.packages = youtube-packages;
  };
}
