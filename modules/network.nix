{
  pkgs,
  config,
  ...
}: let
  cfg = config.zenworks;
  modules = import ./options.nix {inherit pkgs;};
  optionals = pkgs.lib.lists.optionals;
in {
  options.zenworks = modules.networking;
  config = {
    programs = {
      wireshark = pkgs.lib.mkIf cfg.wireshark {
        enable = true;
        usbmon.enable = true;
        dumpcap.enable = true;
      };
      winbox = pkgs.lib.mkIf cfg.winbox {
        enable = true;
        package = pkgs.winbox4;
        openFirewall = true;
      };
    };
    networking = {
      hostName = cfg.hostname;
      networkmanager = {
        enable = true;
      };
      firewall = {
        allowedTCPPorts = cfg.tcpPorts;
        allowedUDPPorts = cfg.udpPorts ++ optionals cfg.winbox [5678];
      };
    };
    environment.systemPackages = with pkgs;
      optionals cfg.wireshark [wireshark]
      ++ optionals cfg.cloudflared [cloudflared]
      ++ optionals cfg.winbox [winbox]
      ++ optionals cfg.iperf [iperf];
  };
}
