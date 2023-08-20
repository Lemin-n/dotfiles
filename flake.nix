{
  description = "Nixzen configuration";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        ./hosts
        ./pkgs
      ];

      perSystem = { config, pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.alejandra pkgs.git ];
          name = "Zenparadise";
          DIRENV_LOG_FORMAT = "";
        };
        # Nix Formatter
        formatter = pkgs.alejandra;
      };
    };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
}
