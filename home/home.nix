{ ... }:

{
  imports = [
    ./nvim.nix
    ./fonts.nix
    ./fish.nix
    ./git.nix
    ./terminal.nix
    ./theme.nix
    ./desktop-packages.nix
  ];

  home.username = "sburcksen";
  home.homeDirectory = "/home/sburcksen";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
