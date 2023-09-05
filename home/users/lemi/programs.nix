{ pkgs, ... }:
{
  programs = {

    neovim = import ../../../modules/nvim { inherit pkgs; };
    alacritty = import ../../../modules/alacritty { inherit pkgs; };

    ssh = {
      enable = true;
    };
    zsh = {
      enable = true;
      shellAliases = {
        nmr = "nmcli device wifi connect Ruscitti password UnaClave";
        ls = "exa -1lTFgHh -L 1 --octal-permissions -t changed --icons";
      };
      enableAutosuggestions = true;
      #initExtra = "Hyprland";
    };
    exa = {
      enable = true;
    };
    starship = {
      enable = true;
    };
    home-manager.enable = true;
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload= ~/.config/wallpapers/yokohama-carrousel.jpg
    wallpaper=,~/.config/wallpapers/yokohama-carrousel.jpg
  '';
}

