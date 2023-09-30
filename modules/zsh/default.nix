{ pkgs, ... }: {
  enable = true;
  shellAliases = {
    nmr = "nmcli device wifi connect Ruscitti password UnaClave";
    ls = "exa";
    cat = "bat";
    cd = "z";
  };
  enableAutosuggestions = true;
  enableCompletion = true;
}
