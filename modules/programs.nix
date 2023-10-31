{...}: {
  programs = {
    hyprland = {
      enable = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    zsh = {
      enable = true;
    };
    light = {
      enable = true;
    };
  };
}
