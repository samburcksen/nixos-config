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
    ./dotfiles.nix
  ];

  home.username = "sburcksen";
  home.homeDirectory = "/home/sburcksen";

  home.stateVersion = "24.11";
}
