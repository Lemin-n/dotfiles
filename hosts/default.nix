{ inputs, withSystem, ... }: {
  flake.nixosConfigurations = withSystem "x86_64-linux"
    ({ system, config, ... }:
      let
        systemInputs = { _module.args = { inherit inputs; }; };
        inherit (inputs.nixpkgs.lib) nixosSystem;
      in
      {
        nixzen = nixosSystem {
          inherit system
            ;
          modules = [
            ./nixzen
	{environment.systemPackages = [config.packages.neovim];}
];
          specialArgs = {
            inherit inputs;
          };
        };
      });
}
