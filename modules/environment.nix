{
  pkgs,
  inputs,
  ...
}: {
  environment.sessionVariables = {
    PATH = [
      "$HOME/.cargo/bin/"
      "$HOME/.npm-global/bin"
      "$HOME/.config/script"
    ];
  };

  powerManagement.cpuFreqGovernor = "ondemand";
  environment.systemPackages = with pkgs; [
    # Default
    inputs.agenix.packages.${system}.default
    curl
    cloudflared
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
