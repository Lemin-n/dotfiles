let starship_cache = $"($env.HOME)/.cache/starship"
starship init nu | save --force $"($env.HOME)/.cache/starship/init.nu"

$env.STARSHIP_SHELL = "nu"
# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = "create_left_prompt"
$env.PROMPT_COMMAND_RIGHT = ""
# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "
$env.BUILD_CACHE = "/home/cache"
$env.EDITOR = "nvim"
$env.VIRUAL = "nvim"
$env.PATH = ([
	$env.PATH
[
      		$"($env.HOME)/.cargo/bin"
      		$"($env.HOME)/.npm-global/bin"
      		$"($env.HOME)/.config/script"
      		$"($env.HOME)/.bun/bin"
		]
] | flatten)
$env.TEMPLATES = $"($env.HOME)/flakes"

alias ll = eza -1lTFgHh -L 1 --octal-permissions -t changed
alias nmr = nmcli device wifi connect Ruscitti password UnaClave
alias cat = bat
