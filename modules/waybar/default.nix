{...}: {
  enable = true;
  settings = {
    mainBar = {
      layer = "bottom";
      position = "top";
      margin-top = 5;
      height = 20;
      modules-left = ["wlr/workspaces"];
      modules-center = ["hyprland/window"];
      modules-right = [
        "tray"
        "backlight"
        "pulseaudio"
        "network"
        "idle_inhibitor"
        "battery"
        "clock"
      ];
      "wlr/workspaces" = {
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "1" = " ";
          "2" = " ";
          "3" = " ";
          "4" = " ";
          "5" = " ";
          urgent = " ";
          active = " ";
          default = " ";
        };
        sort-by-number = true;
      };
      "hyprland/window" = {
        max-length = 80;
      };
      clock = {
        format = "{:%a %d %b %H:%M}";
        tooltip = false;
      };
      battery = {
        format = "{capacity}% {icon}";
        format-alt = "{time} {icon}";
        format-icons = ["  " "  " "  " "  " "  "];
        format-charging = "{capacity}% 󱊦 ";
        interval = 30;
        states = {
          warning = 15;
          critical = 5;
        };
        tooltip = false;
      };
      network = {
        format = "{icon}";
        format-alt = "{ipaddr}/{cidr} {icon}";
        format-alt-click = "click-right";
        format-icons = {
          wifi = ["󰤟 " "󰤢 " "󰤨 "];
          ethernet = ["󰈀 "];
          disconnected = ["󰇨 "];
        };
        tooltip = false;
      };
      pulseaudio = {
        format = "{icon}";
        format-alt = "{volume} {icon}";
        format-alt-click = "click-right";
        format-muted = "󰝟 ";
        format-icons = {
          phone = ["  󰖁 " "  󰕿 " "  󰖀 " "  󰕾 "];
          default = ["󰖁 " "󰕿 " "󰖀 " " "];
        };
        scroll-step = 1;
        on-click = "pavucontrol";
      };
      backlight = {
        format = "{icon}";
        format-alt = "{percent}% {icon}";
        format-alt-click = "click-right";
        format-icons = ["󰖔 " "󰖙 "];
        on-scroll-down = "light -A 1";
        on-scroll-up = "light -U 1";
        tooltip = false;
      };
      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = " ";
          deactivated = "";
        };
        tooltip = false;
      };
      tray = {
        icon-size = 18;
      };
    };
  };
  style = ''
    * {
        border:        none;
        border-radius: 0;
        font-family:   Comic Mono;
        font-size:     16px;
        box-shadow:    none;
        text-shadow:   none;
        transition-duration: 0s;
    }
    #mode, #battery, #cpu, #memory, #network, #pulseaudio, #idle_inhibitor, #backlight, #custom-storage, #custom-spotify, #custom-weather, #custom-mail {
        margin:     0px 6px 0px 10px;
        min-width:  25px;
    }
    #clock {
        margin:     0px 16px 0px 10px;
        min-width:  140px;
    }
    #battery.warning {
       color:       rgba(255, 210, 4, 1);
    }
    #battery.critical {
        color:      rgba(238, 46, 36, 1);
    }
    #battery.charging {
        color:      rgba(217, 216, 216, 1);
    }
    window {
      color: rgba(217, 216, 216, 1);
      background: rgba(0, 0, 0, 0);
    }
    window#waybar {
      color: rgba(217, 216, 216, 1);
      background: rgba(35, 31, 32, 0);
      margin-top: 20px;
    }
    #workspaces {
        margin: 0 5px;
    }
    #workspaces button {
        padding:    0 5px;
        color:      rgba(217, 216, 216, 0.4);
    }
    #workspaces button.visible {
        color:      rgba(217, 216, 216, 1);
    }
    #workspaces button.active {
        border-top: 3px solid rgba(217, 216, 216, 1);
        border-bottom: 3px solid rgba(217, 216, 216, 0);
    }
    #workspaces button.urgent {
        color:      rgba(238, 46, 36, 1);
    }
    #custom-storage.warning {
        color:      rgba(255, 210, 222, 1);
    }
    #custom-storage.critical {
        color:      rgba(238, 46, 36, 1);
    }
  '';
}
