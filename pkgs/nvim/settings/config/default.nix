{ lib, pkgs, ... }:
{
  imports = [ ./options.nix ./globals.nix ./autoCmd.nix ./maps.nix ./theme.nix ];
  clipboard.providers.wl-copy.enable = true;
}
