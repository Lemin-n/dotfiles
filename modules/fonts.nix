{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    comic-mono
    (nerdfonts.override { fonts = [ "Agave" "ComicShannsMono" "UbuntuMono" ]; })
  ];
}
