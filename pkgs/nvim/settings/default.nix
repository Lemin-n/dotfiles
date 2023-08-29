{ lib, pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./config
    ./plugins
  ];
}
