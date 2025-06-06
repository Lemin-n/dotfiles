{pkgs, ...}: let
  env = builtins.getEnv "NVIM_RUST_FEATURES";
in
  with pkgs.vimPlugins; {
    plugin = rustaceanvim;
    type = "lua";
    config = pkgs.lib.strings.fileContents ./rustaceanvim.lua;
  }
