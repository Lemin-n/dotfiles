{ inputs, ... }:
{
  systems = [ "x86_64-linux" ];
  perSystem = { config, inputs, pkgs, ... }: {
    config.packages = {
      xwaylandvideobridge =
        pkgs.libsForQt5.callPackage ./xwaylandvideobridge { };
    };
  };
}
