{pkgs, ...}: {
  users.users.lemi = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "docker" "networkmanager"];
    shell = with pkgs; zsh;
  };
}
