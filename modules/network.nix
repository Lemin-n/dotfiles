{ inputs
, pkgs
, config
, ...
}: {
  networking = {
    hostName = "nixzen";
    networkmanager = {
      enable = true;
    };
    firewall = {
      allowedTCPPorts = [ 5000 5173 5174 ];
    };
  };
}
