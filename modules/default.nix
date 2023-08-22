{ self, inputs, ... }:
{
  systems = [ "x86_64-linux" ];


  flake.nixosModules = {
    network = import ./network.nix;
  };
}
