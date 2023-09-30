{ pkgs, ... }: {
  enable = true;
  environmentVariables = {
    EDITOR = "nvim";
  };
}
