{
  pkgs,
  self',
  config,
  ...
}: let
  cfg = config.sounix;
  lib = pkgs.lib;
  modules = import ./options.nix {inherit pkgs;};
in {
  options.sounix = {
    bluetooth = modules.bluetooth;
    soundBackend = modules.soundBackend;
  };
  config = {
    services = {
      pulseaudio = lib.mkIf (cfg.soundBackend == "pulseaudio") {
        enable = true;
        support32Bit = true;
        package = pkgs.pulseaudioFull;
        daemon.config = {
          realtime-scheduling = "yes";
        };
        extraModules = with pkgs; [
          pulseaudio-module-xrdp
        ];
      };
      pipewire = lib.mkIf (cfg.soundBackend == "pipewire") {
        systemWide = true;
        enable = cfg.soundBackend != "pulseaudio";
        alsa.enable = true;
        alsa.support32Bit = true;
        audio.enable = true;
        jack.enable = true;
        pulse.enable = true;
      };
      blueman = lib.mkIf cfg.bluetooth {enable = true;};
    };
    hardware = {
      bluetooth = lib.mkIf cfg.bluetooth {
        enable = true;
        powerOnBoot = true;
        hsphfpd.enable = cfg.soundBackend != "pipewire";
        settings = {
          General = {
            Experimental = true;
            FastConnectable = true;
            Enable = "Source,Sink,Media,Socket";
          };
          Policy = {
            AutoEnable = true;
          };
        };
      };
    };
    security.rtkit = lib.mkIf (cfg.soundBackend == "pipewire") {enable = true;};
    #systemd.user.services.wireplumber.wantedBy = lib.lists.optionals (cfg.soundBackend == "pipewire") #[
    #"default.target"
    #];
  };
}
