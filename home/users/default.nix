{
  pkgs,
  inputs,
  lib,
  ...
}: {
  home-manager.users = {
    lemi = import ./lemi {
      inherit pkgs inputs lib;
    };
  };
}
