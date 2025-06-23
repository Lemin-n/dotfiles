{
  inputs,
  pkgs,
  config,
  ...
}: {
  networking = {
    hostName = "nixzen";
    networkmanager = {
      enable = true;
    };
    firewall = {
      allowedTCPPorts = [
        # Markdown Preview
        9808
        # Dufs default port
        5000
        # First Vite
        5173
        # Second Vite
        5174
        #pg
        5432
      ];
      #Winbox multicast ports
      allowedUDPPorts = [
        5678
      ];
    };
  };
}
