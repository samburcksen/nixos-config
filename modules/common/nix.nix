{ allowUnfreePredicate, ... }:

{
  # Enable Nix Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Explicitly require unfree packages to be specified
  nixpkgs.config = {
    allowUnfree = false;
    inherit allowUnfreePredicate;
  };

  system.stateVersion = "24.11";
}
