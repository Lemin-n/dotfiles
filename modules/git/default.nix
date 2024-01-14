{pkgs, ...}: let
  cfg = cfg.zengit;
in {
  options.zengit = with pkgs.lib; {
    enable = mkEnableOption "Enable zengit config and packages";
    userName = mkOption {
      type = types.str;
    };
    userEmail = mkOption {
      type = types.str;
    };
  };
  config = pkgs.lib.mkIf cfg.enable {
    programs.git = {
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
    home.packages = with pkgs; [
      git
      gitoxide
    ];
  };
}
