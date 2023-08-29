{ lib, pkgs, ... }:
{
  imports = [ ./options.nix ./globals.nix ./autoCmd.nix ./maps.nix ./theme.nix ./extraPlugins.nix ];
  clipboard.providers.wl-copy.enable = true;
}
