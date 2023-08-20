{
  # https://github.com/zbirenbaum/copilot.lua
  # https://nix-community.github.io/nixvim/plugins/copilot-lua/index.html
  plugins.copilot-lua =
    {
      enable = true;
      suggestion = {
        enabled = false;
      };
      panel = {
        enabled = false;
      };
      filetypes = {
        rust = false;
        "*" = true;
      };
    };
}
