{pkgs, ...}: {
  enable = true;
  enableZshIntegration = true;
  enableNushellIntegration = true;
  settings = {
    add_newline = true;
    format = "$all";
    rust = {
      format = "[$symbol ($version ) ]($style)";
      version_format = "ver $\{major\}";
    };
    nix_shell = {
      symbol = "❄️ ";
      format = "[$symbol$state( \( [$name] \))]($style)";
    };
  };
}
