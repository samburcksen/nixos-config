{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./audio.nix
    ./bluetooth.nix
    ./locale.nix
    ./users.nix
    ./nvidia.nix
    ./hyprland.nix
  ];

  # Enable Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Required by Kanata
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

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
    home-manager

    gcc
    cargo
    rustup

    fzf
    stow
    wget
    unzip

    (catppuccin-sddm.override {
        flavor = "mocha";
        font = "JetBrainsMono";
        fontSize = "16";
    })

#    kanata
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };

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


  system.stateVersion = "24.11";
}
