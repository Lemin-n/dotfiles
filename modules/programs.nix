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
    light = {
      enable = true;
    };
  };
}
