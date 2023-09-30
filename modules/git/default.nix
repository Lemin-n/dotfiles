{ pkgs, ... }: {
  enable = true;
  userName = "Lemin-n";
  userEmail = "emiliorccp@gmail.com";
  aliases = {
    aa = "add .";
    co = "checkout";
    b = "branch";
    cc = "commit -m ";
    pm = "push origin main";
    pl = "pull";
  };
  delta = {
    enable = true;
    options = {
      decorations = { };
      features = "decorations";
      whitespace-error-style = "22 reverse";
      syntax-theme = "Nord";
    };
  };
}
