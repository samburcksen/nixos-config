{ modules, ... }:

{
  networking.hostName = "Laptop-Nix-SB";
  
  imports = with modules; [
    ./desktop-hardware.nix
    bluetooth.nix
    boot.nix
    audio.nix
    nvidia.nix
    hyprland.nix
    wifi.nix
  ];

  # Overwrite default logind behaviour
  services.logind.extraConfig = ''
    # Lid behavior is handled by Hyprland
    HandleLidSwitch=ignore
  '';
}
