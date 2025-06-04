{ pkgs, ... }:

{
  # Enable Nix Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages and add unstable branch
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable =
        import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz")
          { };
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

  system.stateVersion = "24.11";
}
