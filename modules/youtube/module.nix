lib:
with lib; {
  tui = mkOption {
    type = types.bool;
    default = true;
  };
  music = mkOption {
    type = types.bool;
    default = false;
  };
}
