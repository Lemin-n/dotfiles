source /home/lemi/.cache/init.nu
source /home/lemi/.cache/starship/init.nu
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
$env.PATH = ($env.PATH | prepend "/home/lemi/.config/carapace/bin")

let carapace_completer = {|spans|
  carapace $spans.0 nushell $spans | from json
}

$env.config = {
	show_banner: false,
        completions: {
          external: {
            enable: true
            completer: $carapace_completer
          }
        }
      }
