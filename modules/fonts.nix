{pkgs, ...}: {
  fonts.packages = with pkgs; [comic-mono] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
