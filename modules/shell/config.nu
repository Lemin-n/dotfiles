source /home/lemi/.cache/zoxide/init.nu
source /home/lemi/.cache/starship/init.nu
def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

let carapace_completer = {|spans|
  carapace $spans.0 nushell ...$spans | from json
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
