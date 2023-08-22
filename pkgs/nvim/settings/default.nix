{ lib, pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./config
    ./plugins
  ];
  extraPlugins = with pkgs.vimPlugins; [
    limelight-vim
    goyo-vim
  ];
}
