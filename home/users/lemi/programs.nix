{ pkgs, ... }: {
  programs = {
    neovim = import ../../../modules/nvim { inherit pkgs; };
    alacritty = import ../../../modules/alacritty { inherit pkgs; };

    ssh = {
      enable = true;
    };
    exa = {
      enable = true;
    };
    starship = {
      enable = true;
    };
    zsh = {
      enable = true;
      shellAliases = {
        nmr = "nmcli device wifi connect Ruscitti password UnaClave";
        ls = "exa -1lTFgHh -L 1 --octal-permissions -t changed --icons";
      };
      enableAutosuggestions = true;
      enableCompletion = true;
    };
    home-manager.enable = true;
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload= ~/.config/wallpapers/yokohama-carrousel.jpg
    preload= ~/.config/wallpapers/fujisan.jpg
    preload= ~/.config/wallpapers/yokohama.jpg
    preload= ~/.config/wallpapers/japan-temple.jpg
    preload= ~/.config/wallpapers/sci-fi-japan.jpg

    wallpaper=,~/.config/wallpapers/japan-temple.jpg
  '';
  home.file.".config/script/screenshot" = {
    executable = true;
    source = ../../../script/screenshot;
  };
}
