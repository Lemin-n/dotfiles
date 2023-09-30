{ pkgs, ... }: {
  enable = true;
  shellAliases = {
    nmr = "nmcli device wifi connect Ruscitti password UnaClave";
    ls = "exa";
    cat = "bat";
    cd = "zoxide";
  };
  enableAutosuggestions = true;
  enableCompletion = true;
}
