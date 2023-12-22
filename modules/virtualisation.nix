{...}: {
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };
    virtualbox.host.enable = true;
  };
  users.extraGroups.vboxusers.members = ["lemi"];
}
