{ 
    hyprland.enable = true;
    zsh = {
      enable = true;
      shellAliases = {
        nmr = "nmcli device wifi connect Ruscitti password UnaClave";
      };
      autosuggestions = {
        enable = true;
      };
      loginShellInit = "Hyprland";
    };
    light = {
      enable = true;
    };
    starship = {
      enable = true;
    };
}
