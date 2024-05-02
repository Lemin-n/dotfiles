{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.devEnv;
in
  with lib; {
    options.devEnv = {
      rust = mkEnableOption "Enable Rust development environment";
      tauri = mkEnableOption "Enable Tauri development environment";
      lua = mkEnableOption "Enable Lua development environment";
      nix = mkEnableOption "Enable Nix development environment";
      php = mkEnableOption "Enable PHP development environment";
      node = mkEnableOption "Enable Node development environment";
      bun = mkEnableOption "Enable Bun development environment";
      deno = mkEnableOption "Enable Deno development environment";
      python = mkEnableOption "Enable Python3 development environment";
      web = mkEnableOption "Enable Web development environment";
      go = mkEnableOption "Enable Go development environment";
    };
    config = {
      home.packages = with pkgs.lib.lists;
        optionals cfg.rust (with pkgs; [
          fenix.complete.toolchain
          cargo-leptos
          cargo-shuttle
          leptosfmt
          cargo-make
          trunk
        ])
        ++ optionals cfg.tauri [pkgs.cargo-tauri]
        ++ optionals cfg.deno [pkgs.deno]
        ++ optionals cfg.node [pkgs.nodejs]
        ++ optionals cfg.bun [pkgs.bun]
        ++ optionals cfg.php [
          pkgs.php
          pkgs.php82Packages.composer
        ]
        ++ optionals cfg.go [pkgs.go]
        ++ optionals cfg.python [pkgs.python3]
        ++ optionals cfg.web [pkgs.nodePackages.tailwindcss]
        ++ optionals cfg.go [pkgs.go];
    };
  }
