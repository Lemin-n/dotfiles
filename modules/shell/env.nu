let starship_cache = "/home/lemi/.cache/starship"
starship init nu | save --force /home/lemi/.cache/starship/init.nu


$env.STARSHIP_SHELL = "nu"
# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "
$env.EDITOR = nvim

alias ll = eza -1lTFgHh -L 1 --octal-permissions -t changed
alias nmr = nmcli device wifi connect Ruscitti password UnaClave
alias cat = bat
