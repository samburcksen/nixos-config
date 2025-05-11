{ config, pkgs, ... }:

{
  networking.hostName = "Desktop-Nix-SB";
  
  imports = [
    ./desktop-hardware.nix
    ../modules/bluetooth.nix
    ../modules/boot.nix
    ../modules/audio.nix
    ../modules/nvidia.nix
    ../modules/hyprland.nix
    ../modules/wifi.nix
  ];
}
