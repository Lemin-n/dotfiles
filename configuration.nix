{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  fonts.fonts = with pkgs;[
    comic-mono
    (nerdfonts.override { fonts = [ "Agave" "ComicShannsMono" "UbuntuMono" ]; })
  ];

  networking.hostName = "nixzen"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "America/Argentina/Rio_Gallegos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "comic-mono";
    keyMap = "us";
    useXkbConfig = true;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  services.printing.enable = true;

  sound.enable = true;

  hardware.pulseaudio.enable = true;

  users.users.lemi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      rnix-lsp
      rust-analyzer
      curl
      git
      hyprland
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    rustup
    brave
    zsh
    zimfw
    zellij
    wev
    ntfs3g
    hyprpaper
    openssl
    lua-language-server
    hyprpicker
    gcc_multi
    rnix-lsp
    wofi
    waybar
    git
    nodejs
    python3
    curl
    wget
  ];
  programs = {
    bash.loginShellInit = "Hyprland";
    hyprland.enable = true;
    zsh = {
      enable = true;
      enableZshIntegration = true;
    };

    #neovim = {
    #	enable = true;
    #	viAlias = true;
    #	vimAlias = true;
    #	defaultEditor = true;
    #	configure = {
    #         packages.neovimPlugins = with pkgs.vimPlugins; {
    #          # loaded on launch
    #         start = [ lazy-nvim nvim-treesitter.withAllGrammars ];
    #        # manually loadable by calling `:packadd $plugin-name`
    #       opt = [ ];
    #    };
    #	};

    #};
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

