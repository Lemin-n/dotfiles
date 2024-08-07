{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.wallpapers;
in {
  options.wallpapers = {
    enable = mkEnableOption "Enable wallpapers";
    name = mkOption {
      type = types.str;
    };
    path = mkOption {
      type = types.path;
      default = ../wallpapers;
    };
  };

  config =
    mkIf cfg.enable
    {
      home.file.".config/wallpapers/fujisan.jpg" = {
        source = ../wallpapers/fujisan.jpg;
      };
      home.file.".config/wallpapers/thus-spoke-apocalypse.png" = {
        source = ../wallpapers/thus-spoke-apocalypse.png;
      };
      home.file.".config/wallpapers/japan-temple.jpg" = {
        source = ../wallpapers/japan-temple.jpg;
      };
      home.file.".config/wallpapers/sci-fi-japan.jpg" = {
        source = ../wallpapers/sci-fi-japan.jpg;
      };
      home.file.".config/wallpapers/tokito.jpeg" = {
        source = ../wallpapers/tokito.jpeg;
      };
      home.file.".config/wallpapers/yokohama-carrousel.jpg" = {
        source = ../wallpapers/yokohama-carrousel.jpg;
      };
      home.file.".config/wallpapers/yokohama.jpg" = {
        source = ../wallpapers/yokohama.jpg;
      };
      home.file.".config/wallpapers/blue-sky.png" = {
        source = ../wallpapers/blue-sky.png;
      };
      home.file.".config/script/partstats" = {
        source = ../script/partstats;
      };
      home.file."screenshots/README.md" = {
        text = ''
          # Screenshots folder for hyprline shortcuts
        '';
      };
      home.file.".config/sss/config.toml" = {
        source = ../config.toml;
      };
    };
}
