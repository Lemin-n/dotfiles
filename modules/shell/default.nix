{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.usershell;
  shellAliases = {
    nmr = "nmcli device wifi connect Ruscitti password UnaClave";
    cat = "bat";
    cd = "z";
  };
  shellConfig = {
    zsh = {
      shellAliases = shellAliases;
      enableAutosuggestions = true;
      enableCompletion = true;
    };
    nushell = {
      shellAliases =
        shellAliases
        // {
          ls = "exa";
        };
      configFile.text = ''
        $env.STARSHIP_SHELL = "nu"

        def create_left_prompt [] {
            starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
        }

        # Use nushell functions to define your right and left prompt
        $env.PROMPT_COMMAND = { || create_left_prompt }
        $env.PROMPT_COMMAND_RIGHT = ""

        # The prompt indicators are environmental variables that represent
        # the state of the prompt
        $env.PROMPT_INDICATOR = ""
        $env.PROMPT_INDICATOR_VI_INSERT = ": "
        $env.PROMPT_INDICATOR_VI_NORMAL = "〉"
        $env.PROMPT_MULTILINE_INDICATOR = "::: "
      '';
      environmentVariables = {
        EDITOR = "nvim";
      };
    };
  };
  selectedShell =
    if cfg.shell == pkgs.zsh
    then "zsh"
    else "nushell";
in {
  options.usershell = with lib; {
    shell = mkOption {
      type = types.enum [pkgs.zsh pkgs.nushell];
      default = pkgs.zsh;
    };
    user = mkOption {
      type = types.str;
    };
  };
  config = {
    users.users."${cfg.user}".shell = cfg.shell;

    home-manager.users."${cfg.user}".programs."${selectedShell}" = shellConfig."${selectedShell}";
  };
}
