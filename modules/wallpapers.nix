{ lib
, pkgs
, config
, ...
}:
with lib; let
  cfg = config.wallpapers;
in
{
  options.wallpapers = {
    enable = mkEnableOption "Enable wallpapers";
    name = mkOption {
      type = types.str;
    };
  };

  # Define what other settings, services and resources should be active IF
  # a user of this "hello.nix" module ENABLED this module
  # by setting "services.hello.enable = true;".
  config = mkIf cfg.enable {
    home-manager.users.${cfg.name} = {
      home.file.".config/wallpapers/fu-hua.png" = {
        source = ../wallpapers/fu-hua.png;
      };
      home.file.".config/wallpapers/fujisan.jpg" = {
        source = ../wallpapers/fujisan.jpg;
      };
      home.file.".config/wallpapers/japan-temple.jpg" = {
        source = ../wallpapers/japan-temple.jpg;
      };
      home.file.".config/wallpapers/rengoku.jpg" = {
        source = ../wallpapers/rengoku.jpg;
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
      home.file."screenshots/README.md" = {
        text = ''
          # Screenshots folder for hyprline shortcuts
        '';
      };
    };
  };
}
