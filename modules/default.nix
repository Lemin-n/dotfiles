{ self, inputs,systems,flake, ... }:
{
	
  perSystem = { config, inputs, pkgs, systems, ... }: {
  config.nixosConfigurations = {
    network = import ./network.nix;
    programs = import ./programs.nix;
  };};
}
