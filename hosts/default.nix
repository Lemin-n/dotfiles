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
            imports = [
              inputs.sss.nixosModules.default
            ];
            programs.sss = {
              enable = true;
            };
            environment.systemPackages = [config.packages.xwaylandvideobridge inputs.nixpkgs.legacyPackages.${system}.slurp];
          }
        ];

        specialArgs = {
          inherit inputs;
        };
      };

      lenarth = nixosSystem {
        inherit system;

        modules = [
          inputs.hm.nixosModule
          ./lenarth
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
            imports = [
              inputs.sss.nixosModules.default
            ];
            programs.sss = {
              enable = true;
            };
            environment.systemPackages = [config.packages.xwaylandvideobridge inputs.nixpkgs.legacyPackages.${system}.slurp];
          }
        ];

        specialArgs = {
          inherit inputs;
        };
      };
    });
}
