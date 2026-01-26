{
  pkgs,
  config,
  ...
}:
let
  cfg = config.gamenix;
  modules = import ./options.nix { inherit pkgs; };
in
{
  options.gamenix = modules.gaming;
  config = {
    programs = {
      steam = {
        enable = cfg.steam && cfg.enable;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        protontricks = {
          enable = true;
        };
        extraCompatPackages = [
          pkgs.proton-ge-bin
        ];
      };
    };
  };
}
