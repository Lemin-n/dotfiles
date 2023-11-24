let starship_cache = "/home/lemi/.cache/starship"
if not ($starship_cache | path exists) {
  mkdir $starship_cache
}
starship init nu | save --force /home/lemi/.cache/starship/init.nu

$env.EDITOR = nvim
