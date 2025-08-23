{ pkgs, ... }:

{
  home.packages = [
    pkgs.pkgs.nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;
}
