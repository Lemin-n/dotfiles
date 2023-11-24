let zoxide_cache = "/home/lemi/.cache/zoxide"
if not ($zoxide_cache | path exists) {
  mkdir $zoxide_cache
}
/nix/store/hfb7z56gw93mprlp52x3k841hw5ypx75-zoxide-0.9.2/bin/zoxide init nushell  | save --force /home/lemi/.cache/zoxide/init.nu

let starship_cache = "/home/lemi/.cache/starship"
if not ($starship_cache | path exists) {
  mkdir $starship_cache
}
/home/lemi/.nix-profile/bin/starship init nu | save --force /home/lemi/.cache/starship/init.nu

$env.EDITOR = nvim
