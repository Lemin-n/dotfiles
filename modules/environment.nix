{
  pkgs,
  inputs,
  ...
}:
{
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PATH = [
      "$HOME/.cargo/bin/"
      "$HOME/.npm-global/bin"
      "$HOME/.config/script"
      "$HOME/.bun/bin/"
    ];
  };
  powerManagement.cpuFreqGovernor = "ondemand";
  environment.systemPackages = with pkgs; [
    # Default
    inputs.antigravity-nix.packages.x86_64-linux.default
    inputs.agenix.packages.${system}.default
    curl
    remmina
    #wrangler
    ripgrep
    git
    wget
    pkg-config
    openssl
    ntfs3g
    ouch
    fd
  ];
}
