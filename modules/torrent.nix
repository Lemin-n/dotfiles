{...}: {
  services = {
    jackett = {
      enable = true;
      dataDir = "/home/jackett";
      openFirewall = true;
    };
  };
}
