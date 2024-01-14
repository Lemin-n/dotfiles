{
  inputs,
  withSystem,
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
      inherit (inputs.nixpkgs.lib) nixosSystem;
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
