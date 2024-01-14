{
  pkgs,
  config,
  ...
}: let
  cfg = config.zenprland;
in {
  options.zenprland = with pkgs.lib; {
    enable = mkEnableOption "Enable Hyprland as main WM";
    main-mod = mkOption {
      type = types.str;
      default = "SUPER";
    };
    touchpad = mkOption {
      type = types.bool;
      default = false;
    };
    username = mkOption {
      type = types.str;
    };
    keyboard = mkOption {
      type = types.submodule {
        options = {
          layout = mkOption {
            type = types.enum ["us"];
            default = "us";
          };
          variant = mkOption {
            type = types.enum ["altgr-intl"];
            default = "altgr-intl";
          };
        };
        config = {};
      };
      default = {};
    };
    layout = mkOption {
      type = types.enum ["master" "dwindle"];
      default = "master";
    };
    rounding = mkOption {
      type = types.number;
      default = 10;
    };
  };

  config = {
    home.packages = with pkgs; [
      hyprpaper
      hyprpicker
      wofi
      cliphist
      wl-clip-persist
    ];

    # Iterate over wallpaper folder and set default
    home.file.".config/hypr/hyprpaper.conf".text = ''
      preload= ~/.config/wallpapers/yokohama-carrousel.jpg
      preload= ~/.config/wallpapers/fujisan.jpg
      preload= ~/.config/wallpapers/yokohama.jpg
      preload= ~/.config/wallpapers/japan-temple.jpg
      preload= ~/.config/wallpapers/sci-fi-japan.jpg
      wallpaper=,~/.config/wallpapers/japan-temple.jpg
    '';

    wayland.windowManager.hyprland = pkgs.lib.mkIf cfg.enable {
      enable = true;
      settings = {
        monitor = ",highres,auto,1";
        exec-once = "waybar &> /dev/null | hyprpaper &> /dev/null | wl-paste --type text --watch cliphist store &> /dev/null | wl-paste --type image --watch cliphist store &> /dev/null | wl-clip-persist --clipboard both &> /dev/null";
        env = "XCURSOR_SIZE,24";
        input = {
          kb_layout = cfg.keyboard.layout;
          kb_variant = cfg.keyboard.variant;
          kb_model = "";
          kb_options = "";
          kb_rules = "";

          follow_mouse = 1;
          numlock_by_default = true;
          scroll_method = "on_button_down";
          scroll_button = 274;
          touchpad.natural_scroll = cfg.touchpad;
          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        };
        general = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          gaps_in = 1;
          gaps_out = 0;
          border_size = 0;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = cfg.layout;
        };

        decoration = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          rounding = cfg.rounding;
          blur = {
            enabled = true;
            size = 2;
            passes = 2;
            new_optimizations = true;
          };
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
        };
        animations = {
          enabled = true;
          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # you probably want this
        };

        master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true;
        };

        gestures = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = "on";
        };
        "$escMod" = "code:9";
        "$minus" = "code:20";
        "$printScreen" = "code:107";
        "$equal" = "code:21";
        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = [
          "${cfg.main-mod}, A, exec, alacritty"
          "${cfg.main-mod}, $escMod, killactive,"
          "${cfg.main-mod} CTRL, $escMod, exit, "
          "${cfg.main-mod}, V, togglefloating, "
          "${cfg.main-mod}, W, exec, wofi --show drun"
          "${cfg.main-mod}, left, movefocus, l"
          "${cfg.main-mod}, right, movefocus, r"
          "${cfg.main-mod}, up, movefocus, u"
          "${cfg.main-mod}, down, movefocus, d"

          # Switch workspaces with mainMod + [0-9]
          "${cfg.main-mod}, 1, workspace, 1"
          "${cfg.main-mod}, 2, workspace, 2"
          "${cfg.main-mod}, 3, workspace, 3"
          "${cfg.main-mod}, 4, workspace, 4"
          "${cfg.main-mod}, 5, workspace, 5"
          "${cfg.main-mod}, 6, workspace, 6"
          "${cfg.main-mod}, 7, workspace, 7"
          "${cfg.main-mod}, 8, workspace, 8"
          "${cfg.main-mod}, 9, workspace, 9"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "${cfg.main-mod} CTRL, 1, movetoworkspace, 1"
          "${cfg.main-mod} CTRL, 2, movetoworkspace, 2"
          "${cfg.main-mod} CTRL, 3, movetoworkspace, 3"
          "${cfg.main-mod} CTRL, 4, movetoworkspace, 4"
          "${cfg.main-mod} CTRL, 5, movetoworkspace, 5"
          "${cfg.main-mod} CTRL, 6, movetoworkspace, 6"
          "${cfg.main-mod} CTRL, 7, movetoworkspace, 7"
          "${cfg.main-mod} CTRL, 8, movetoworkspace, 8"
          "${cfg.main-mod} CTRL, 9, movetoworkspace, 9"
          "${cfg.main-mod}, $printScreen , exec, ~/.config/script/screenshot window"
          "${cfg.main-mod} ALT_L, $printScreen, exec, ~/.config/script/screenshot fullscreen"

          # Scroll through existing workspaces with mainMod + scroll
          "${cfg.main-mod}, mouse_down, workspace, e+1"
          "${cfg.main-mod}, mouse_up, workspace, e-1"
        ];
        binde = [
          "${cfg.main-mod}, $minus , resizeactive, -20 0"
          "${cfg.main-mod}, $equal , resizeactive, 20 0"
        ];
        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = [
          "${cfg.main-mod}, mouse:272, movewindow"
          "${cfg.main-mod}, mouse:273, resizewindow"
        ];
      };
    };
  };
}
