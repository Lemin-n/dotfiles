{ inputs, withSystem, ... }: {
  flake.nixosConfigurations = withSystem "x86_64-linux"
    ({ system, config, self, ... }:
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
          ];
          specialArgs = {
            inherit inputs;
          };
        };
      });
}
