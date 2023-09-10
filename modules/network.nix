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
  };
}
