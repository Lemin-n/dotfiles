{ pkgs, ... }: {
  programs = {
    alacritty = import ../../../modules/alacritty { inherit pkgs; };
    bat = import ../../../modules/bat { inherit pkgs; };
    exa = import ../../../modules/exa { inherit pkgs; };
    feh = import ../../../modules/feh;
    git = import ../../../modules/git { inherit pkgs; };
    gitui = import ../../../modules/gitui { inherit pkgs; };
    htop = import ../../../modules/htop { inherit pkgs; };
    nushell = import ../../../modules/nushell { inherit pkgs; };
    neovim = import ../../../modules/nvim { inherit pkgs; };
    ripgrep = import ../../../modules/ripgrep;
    rofi = import ../../../modules/rofi { inherit pkgs; };
    ssh = import ../../../modules/ssh { inherit pkgs; };
    starship = import ../../../modules/starship { inherit pkgs; };
    waybar = import ../../../modules/waybar { inherit pkgs; };
    wofi = import ../../../modules/wofi { inherit pkgs; };
    zellij = import ../../../modules/zellij { inherit pkgs; };
    zoxide = import ../../../modules/zoxide { inherit pkgs; };
    zsh = import ../../../modules/zsh { inherit pkgs; };
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
  home.file."screenshots/README.md" = {
    text = ''
      # Screenshots folder for hyprline shortcuts
    '';
  };
}
