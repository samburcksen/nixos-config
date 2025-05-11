{ modules, ... }:

{
  networking.hostName = "Desktop-Nix-SB";
  
  imports = with modules; [
    ./desktop-hardware.nix
    bluetooth
    boot
    audio
    nvidia
    hyprland
    wifi
  ];
}
