{ modules, ... }:

{
  networking.hostName = "Desktop-Nix-SB";

  imports = with modules; [
    ./hardware.nix
    bluetooth
    boot
    locale
    user
    audio
    nvidia
    shell
    hyprland
    wifi
  ];
}
