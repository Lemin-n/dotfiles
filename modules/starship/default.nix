{ pkgs, ... }: {
  enable = true;
  enableZshIntegration = true;
  enableNushellIntegration = true;
  settings = {
    add_newline = true;
    rust = {
      format = "[$symbol ($version ) ]($style)";
      version_format = "ver.$\{major\}";
    };
    nix-shell = {
      symbol = "❄️ ";
      format = "[$symbol$state( \( [$name] \))]($style)";
    };
  };
}
