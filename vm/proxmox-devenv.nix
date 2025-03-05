{inputs, ...}: {
  systems = ["x86_64-linux"];
  perSystem = {
    config,
    inputs',
    pkgs,
    ...
  }: {
    config.packages = {
      proxmox-devenv = inputs.nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
          inputs.hm.nixosModule
          ({pkgs, ...}: {
            users.users.lemi = {
              isNormalUser = true;
              extraGroups = ["wheel" "video" "docker" "networkmanager"];
              shell = pkgs.zsh;
              initialPassword = "proxmox2024";
            };

            nixpkgs.config.allowUnfree = true;
            nix.settings.experimental-features = ["nix-command" "flakes"];

            system.stateVersion = "25.02";
            programs.zsh.enable = true;
            home-manager.users.lemi = {pkgs, ...}: {
              imports = [../modules/nvim ../modules/devEnv ../modules/shell ../modules/git];
              nixpkgs.config.allowUnfree = true;
              nixpkgs.overlays = [inputs.fenix.overlays.default];
              programs.home-manager.enable = true;
              manual = {
                html.enable = false;
                json.enable = false;
                manpages.enable = false;
              };
              home = {
                stateVersion = "24.05";

                username = "lemi";
                homeDirectory = "/home/lemi";
              };
              zengit = {
                enable = true;
                userName = "Emilio Ruscitti";
                userEmail = "emiliorccp@gmail.com";
              };
              devEnv = {
                rust = true;
                tauri = true;
                lua = true;
                bun = true;
                php = true;
                python = true;
              };
              zenshell = {
                user = "lemi";
                shell = pkgs.zsh;
                bat = true;
                eza = true;
                starship = true;
                ripgrep = true;
                zoxide = true;
                zellij = true;
              };
            };
          })
        ];
        format = "proxmox-lxc";
      };
    };
  };
}
