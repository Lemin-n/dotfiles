{ pkgs, ... }: {
  enable = true;
  extraConfig = ''
    PermitRootLogin no
  '';
}
