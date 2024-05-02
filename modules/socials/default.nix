{
  lib,
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    slack
    telegram-desktop
    discord
    webcord
  ];
}
