{ ... }:

{
  imports = [
    ./desktop-packages.nix
    ./dotfiles.nix
    ./fish.nix
    ./fonts.nix
    ./git.nix
    ./mako.nix
    ./nvim.nix
    ./terminal.nix
    ./theme.nix
  ];

  home.username = "sburcksen";
  home.homeDirectory = "/home/sburcksen";

  home.stateVersion = "24.11";
}
