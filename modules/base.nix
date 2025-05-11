{ pkgs, ... }:

{
  # Enable Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # uinput required for kanata
  users.groups.uinput = {};
  users.users.sburcksen = {
    isNormalUser = true;
    description = "Sam Burcksen";
    extraGroups = [ "wheel" "input" "uinput" ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Overwrite default logind behaviour
  services.logind.extraConfig = ''
    # Lid behavior is handled by Hyprland
    HandleLidSwitch=ignore
  '';

  # Allow unfree packages and add unstable branch
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {};
    };
  };

  environment.systemPackages = with pkgs; [
    gcc
    cargo
    rustup

    fzf
    stow
    wget
    unzip

  ];

  # Fish
  programs.fish.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  
  system.stateVersion = "24.11";
}
