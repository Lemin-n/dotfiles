{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.wallpapers;
  /*
     loadFiles = filepaths: basepath: builtins.mapAttrs(k: v: let
  	fileName = builtins.baseNameOf(v.)

  in builtins.concatStringsSep("/" [(basepath ? "./") ]) );
  */
  loadFiles = {
    staticFiles,
    basepath ? "./",
  }:
    builtins.listToAttrs (
      builtins.map (
        fileConfig: let
          fileName = builtins.baseNameOf fileConfig.source;
          userLocalFile = builtins.concatStringsSep "/" [
            fileConfig.customBasePath or basepath
            fileName
          ];
        in {
          name = userLocalFile;
          value = (
            builtins.removeAttrs fileConfig ["customBasePath"]
            // {
              force = true;
              recursive = true;
              enable = true;
            }
          );
        }
      )
      staticFiles
    );
in {
  options.wallpapers = {
    enable = mkEnableOption "Enable wallpapers";
    name = mkOption {
      type = types.str;
    };
  };

  config = let
    files = [
      {
        source = ../wallpapers/fujisan.jpg;
      }
      {
        source = ../wallpapers/thus-spoke-apocalypse.png;
      }
      {
        source = ../wallpapers/japan-temple.jpg;
      }
      {
        source = ../wallpapers/sci-fi-japan.jpg;
      }
      {
        source = ../wallpapers/tokito.jpeg;
      }
      {
        source = ../wallpapers/yokohama-carrousel.jpg;
      }
      {
        source = ../wallpapers/miyabi.png;
      }
      {
        source = ../wallpapers/yokohama.jpg;
      }
      {
        source = ../wallpapers/fu-hua.png;
      }
      {
        source = ../wallpapers/blue-sky.png;
      }
      {
        source = ../script/partstats;
        customBasePath = ".config/script";
      }
    ];
    #filesResolved = (files ".config/wallpapers");
  in
    mkIf cfg.enable {
      home.file = loadFiles {
        staticFiles = files;
        basepath = ".config/wallpapers";
      };
    };
}
