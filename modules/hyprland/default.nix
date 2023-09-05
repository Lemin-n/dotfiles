{
  enable = true;
  settings = {
    monitor = ",highres,auto,1";
    exec-once = "waybar &> /dev/null | hyprpaper &> /dev/null";
    env = "XCURSOR_SIZE,24";
    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";
      follow_mouse = 1;
      touchpad = {
        natural_scroll = true;
      };
      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
    };
    general = {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
      layout = "dwindle";
    };

    decoration = {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      rounding = 10;
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
    "$mainMod" = "SUPER";
    "$escMod" = "code:9";
    "$minus" = "code:20";
    "$equal" = "code:21";
    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = [
      "$mainMod, A, exec, alacritty"
      "$mainMod, $escMod, killactive,"
      "$mainMod CTRL, $escMod, exit, "
      "$mainMod, V, togglefloating, "
      "$mainMod, W, exec, wofi --show drun"
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod CTRL, 1, movetoworkspace, 1"
      "$mainMod CTRL, 2, movetoworkspace, 2"
      "$mainMod CTRL, 3, movetoworkspace, 3"
      "$mainMod CTRL, 4, movetoworkspace, 4"
      "$mainMod CTRL, 5, movetoworkspace, 5"
      "$mainMod CTRL, 6, movetoworkspace, 6"
      "$mainMod CTRL, 7, movetoworkspace, 7"
      "$mainMod CTRL, 8, movetoworkspace, 8"
      "$mainMod CTRL, 9, movetoworkspace, 9"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];
    binde = [
      "$mainMod, $minus , resizeactive, -20 0"
      "$mainMod, $equal , resizeactive, 20 0"
    ];
    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}




