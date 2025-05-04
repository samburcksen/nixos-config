{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    waybar
    hyprpaper
    hypridle
    hyprlock
    wlogout
    pavucontrol
    cliphist
    wofi
    mako
    iwgtk
    brightnessctl
    nwg-displays
  ];

  programs.hyprland.enable = true;
  programs.thunar.enable = true;
}
