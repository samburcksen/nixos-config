{ modules, ... }:

{
  networking.hostName = "Desktop-Nix-SB";

  imports = with modules; [
    ./hardware.nix
    ./nvidia.nix
    bluetooth
    boot
    locale
    user
    audio
    shell
    hyprland
    wifi
  ];
}
