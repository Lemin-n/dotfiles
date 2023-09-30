{ pkgs, ... }: {
  programs = {
    neovim = import ../../../modules/nvim { inherit pkgs; };
    alacritty = import ../../../modules/alacritty { inherit pkgs; };
    bat = import ../../../modules/bat { inherit pkgs; };
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
        cat = "bat";
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
  home.file.".config/wallpapers/fu-hua.png" = {
    source = ../../../wallpapers/fu-hua.png;
  };
  home.file.".config/wallpapers/fujisan.jpg" = {
    source = ../../../wallpapers/fujisan.jpg;
  };
  home.file.".config/wallpapers/japan-temple.jpg" = {
    source = ../../../wallpapers/japan-temple.jpg;
  };
  home.file.".config/wallpapers/rengoku.jpg" = {
    source = ../../../wallpapers/rengoku.jpg;
  };
  home.file.".config/wallpapers/sci-fi-japan.jpg" = {
    source = ../../../wallpapers/sci-fi-japan.jpg;
  };
  home.file.".config/wallpapers/tokito.jpeg" = {
    source = ../../../wallpapers/tokito.jpeg;
  };
  home.file.".config/wallpapers/yokohama-carrousel.jpg" = {
    source = ../../../wallpapers/yokohama-carrousel.jpg;
  };
  home.file.".config/wallpapers/yokohama.jpg" = {
    source = ../../../wallpapers/yokohama.jpg;
  };
  home.file.".config/waybar/config" = {
    source = ../../../waybar/config.json;
  };
  home.file.".config/waybar/style.css" = {
    source = ../../../waybar/style.css;
  };
  home.file.".config/waybar/modules/battery.css" = {
    source = ../../../waybar/modules/battery.css;
  };
  home.file.".config/waybar/modules/clock.css" = {
    source = ../../../waybar/modules/clock.css;
  };
  home.file.".config/waybar/modules/style.css" = {
    source = ../../../waybar/modules/style.css;
  };
  home.file.".config/waybar/modules/window.css" = {
    source = ../../../waybar/modules/window.css;
  };
  home.file.".config/waybar/modules/workspaces.css" = {
    source = ../../../waybar/modules/workspaces.css;
  };
  home.file."screenshots/README.md" = {
    text = ''
      # Screenshots folder for hyprline shortcuts
    '';
  };
}
