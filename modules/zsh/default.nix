{pkgs, ...}: {
  enable = true;
  shellAliases = {
    nmr = "nmcli device wifi connect Ruscitti password UnaClave";
    cat = "bat";
    cd = "z";
  };
  enableAutosuggestions = true;
  enableCompletion = true;
}
