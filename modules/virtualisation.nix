{
  pkgs,
  config,
  ...
}: let
  virt = config.virt;
in {
  options.virt = with pkgs.lib; {
    virtManager = mkEnableOption "Enable virt manager for this host";
    docker = mkEnableOption "Enable docker for this host";
  };
  config = {
    virtualisation = {
      docker = {
        enable = virt.docker;
        enableOnBoot = virt.docker;
      };
      libvirtd.enable = virt.virtManager;
      spiceUSBRedirection.enable = virt.virtManager;
    };
  };
}
