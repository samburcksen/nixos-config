{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    waybar
    hyprpaper # Wallpaper
    hypridle
    hyprlock # Lockscreen
    hyprshot # Screenshots
    wlogout
    pavucontrol # Audio control GUI
    cliphist
    wofi # Program launcher
    mako # Notifications
    iwgtk # Wifi GUI
    brightnessctl
    nwg-displays # Display Control GUI
    feh # Image Viewer
    jq # JSON parser required for custom workspace switch behavior
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "JetBrainsMonoNerdFont-Regular";
      fontSize = "16";
    })
  ];

  programs.hyprland.enable = true;
  programs.thunar.enable = true; # File explorer

  # Login manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    package = lib.mkDefault pkgs.kdePackages.sddm;
  };
  services.displayManager.defaultSession = "hyprland";
}
