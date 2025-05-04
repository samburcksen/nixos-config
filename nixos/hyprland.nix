{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    waybar
    hyprpaper
    hypridle
    hyprlock
    hyprshot
    wlogout
    pavucontrol
    cliphist
    wofi
    mako
    iwgtk
    brightnessctl
    nwg-displays
    feh # Image Viewer
    jq # JSON parser required for custom workspace switch behavior
  ];

  programs.hyprland.enable = true;
  programs.thunar.enable = true;
}
