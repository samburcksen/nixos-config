{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ripgrep
    wget
    unzip
    killall
    fd
    fzf
    stow
  ];

  programs.fish.enable = true;

  # Exclude
  programs.nano.enable = false;
}
