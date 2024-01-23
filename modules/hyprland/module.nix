{lib, ...}:
with lib; let
  general-module = {
    sensibility = mkOption {
      type = with lib.types; nullOr float;
      description = "mouse sensitivity (legacy, may cause bugs if not 1, prefer input:sensitivity`)";
    };
  };
in {
  general = mkOption {
    type =
      types.submodule general-module;
  };
}
