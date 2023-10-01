{ pkgs, ... }: {
  programs = {
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
  home.file.".config/zellij/config.kdl" = {
    source = ../../../modules/zellij/config.kdl;
  };
  home.file.".config/zellij/layouts/default.kdl" = {
    text = ''
      layout {
            pane size=1 borderless=true {
                plugin location="zellij:compact-bar"
            }
        }
    '';
  };
  home.file.".config/zellij/layouts/laravel-vite.kdl" = {
    text = ''
      layout {
          pane stacked=true {
              pane command="./vendor/bin/sail" {
      			args "up"
      	       }
              pane command="./vendor/bin/sail" {
       			args "npx" "tailwind" "-i" "./resources/css/app.css" "-o" "./resources/css/style.css" "--watch"
       	      }
              pane command="./vendor/bin/sail" {
       			args "npm" "run" "dev"
      	      }
          }
      }
    '';
  };
  home.file.".config/script/screenshot" = {
    executable = true;
    source = ../../../script/screenshot;
  };
}
