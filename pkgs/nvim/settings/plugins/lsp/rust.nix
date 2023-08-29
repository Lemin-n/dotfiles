{libs, pkgs, ...}:
{
  plugins.rust-tools.enable = true;
  plugins.crates-nvim = {
    enable = true;
    extraOptions = {
      popup = {
        border = "rounded";
        show_version_date = true;
      };
      null_ls = {
        enabled = true;
        name = "Crates";
      };
    };
  };
}
