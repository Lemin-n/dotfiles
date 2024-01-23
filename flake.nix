{
  description = "Nixzen configuration";
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake
    {
      inherit inputs;
    }
    {
      systems = ["x86_64-linux"];

      imports = [
        ./hosts
        ./pkgs
      ];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          packages = [pkgs.alejandra pkgs.git];
          name = "Zenparadise";
          DIRENV_LOG_FORMAT = "";
        };
        # Nix Formatter
        formatter = pkgs.alejandra;
      };
    };

  inputs = {
    wired.url = "github:Toqozz/wired-notify";
    fenix = {
      url = "github:nix-community/fenix";
    };
    sss.url = "git+file:/home/lemi/sss";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    hm = {
      url = "github:nix-community/home-manager";
    };
  };
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://helix.cachix.org"
      "https://fufexan.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "fufexan.cachix.org-1:LwCDjCJNJQf5XD2BV+yamQIMZfcKWR9ISIFy5curUsY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.privatevoid.net:SErQ8bvNWANeAvtsOESUwVYr2VJynfuc9JRwlzTTkVg="
    ];
  };
}
