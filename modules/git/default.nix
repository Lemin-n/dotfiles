{
  pkgs,
  config,
  ...
}: let
  cfg = config.zengit;
in {
  options.zengit = with pkgs.lib; {
    enable = mkEnableOption "Enable zengit config and packages";
    userName = mkOption {
      type = types.str;
    };
    userEmail = mkOption {
      type = types.str;
    };
    gitui = mkOption {
      type = types.bool;
      default = true;
    };
  };
  config = {
    programs.git = pkgs.lib.mkIf cfg.enable {
      enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
      aliases = {
        aa = "add .";
        co = "checkout";
        b = "branch";
        cc = "commit";
        pm = "push origin main";
        pp = "push origin";
        mm = "merge";
        st = "status";
        pl = "pull";
      };
      delta = {
        enable = true;
        options = {
          decorations = {};
          features = "decorations";
          whitespace-error-style = "22 reverse";
          syntax-theme = "Nord";
        };
      };
    };
    programs.gitui.enable = cfg.gitui;
    home.packages = pkgs.lib.mkIf cfg.enable [
      pkgs.git
      pkgs.gitoxide
    ];
  };
}
