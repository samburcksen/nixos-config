{
  pkgs,
  allowUnfreePredicate,
  ...
}:

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

  # Explicitly require unfree packages to be specified
  nixpkgs.config = {
    allowUnfree = false;
    inherit allowUnfreePredicate;
  };

  environment.systemPackages = with pkgs; [
    gcc
    cargo
    rustup
  ];

  system.stateVersion = "24.11";
}
