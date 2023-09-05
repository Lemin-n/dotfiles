{ pkgs, inputs, ... }:
{
  home-manager.users = {
    lemi = import ./lemi {
      inherit pkgs inputs;
    };
  };
}
