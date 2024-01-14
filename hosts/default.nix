{
  inputs,
  withSystem,
  sharedModules,
  ...
}: {
  flake.nixosConfigurations =
    withSystem "x86_64-linux"
    ({
      system,
      config,
      self',
      ...
    }: let
      systemInputs = {_module.args = {inherit inputs;};};
      inherit (inputs.nixpkgs.lib) nixosSystem;
      allowUnfree = {nixpkgs.config.allowUnfree = true;};
    in {
      nixzen = nixosSystem {
        inherit system;

        modules = [
          inputs.hm.nixosModule
          ./nixzen
          {
            environment.systemPackages = [config.packages.xwaylandvideobridge];
          }
        ];

        specialArgs = {
          inherit inputs;
        };
      };

      kalimdar = nixosSystem {
        inherit system;

        modules = [
          inputs.hm.nixosModule
          ./kalimdar
          {
            environment.systemPackages = [config.packages.xwaylandvideobridge];
          }
        ];

        specialArgs = {
          inherit inputs;
        };
      };
    });
}
