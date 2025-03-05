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
      baseConfig = module:
        nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
          };
          modules = [
            inputs.hm.nixosModules.default
            module
            {
              imports = [
                inputs.sss.nixosModules.default
              ];
              programs.sss = {
                enable = true;
              };
              environment.systemPackages = [config.packages.xwaylandvideobridge inputs.nixpkgs.legacyPackages.${system}.slurp];
            }
          ];
        };
    in {
      nixzen = baseConfig ./nixzen;
      lenarth = baseConfig ./lenarth;
      kalimdar = baseConfig ./kalimdar;
    });
}
