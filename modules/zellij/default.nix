{...}: {
  config = {
    programs.zellij = {
      enable = true;
    };
    home = {
      file.".config/zellij/config.kdl" = {
        source = ./config.kdl;
      };
      file.".config/zellij/layouts/default.kdl" = {
        source = ./default-layout.kdl;
      };
      file.".config/zellij/layouts/laravel-vite.kdl" = {
        source = ./laravel-vite.kdl;
      };
    };
  };
}
