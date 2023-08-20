{inputs, systems,...}:
{
    imports = [./nvim];
    #specialArgs = {inherit systems;};
    perSystem = {config, inputs, pkgs,systems, ...}:{
      config.packages.neovim = config.packages.nixvim;
};
  
}
