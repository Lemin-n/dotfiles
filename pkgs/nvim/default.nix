{ inputs, ... }: {
  perSystem = { system, config, pkgs, ... }:
    let
      settings = import ./settings; # import the module directly
      #nixvimLib = inputs.nixvim.lib.${system};
      nixvim = inputs.nixvim.legacyPackages.${system};
      pkgs = import inputs.nixpkgs { inherit system; };
      nvim = nixvim.makeNixvimWithModule {
        module = settings;
      };
    in
    {
      config.packages.nixvim = nvim;
    };
}
