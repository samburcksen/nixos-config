{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ripgrep
    wget
    unzip
    killall
    fd
    fzf
  ];

  programs.fish.enable = true;

  # Exclude
  programs.nano.enable = false;
}
