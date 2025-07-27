{ modules, ... }:

{
  networking.hostName = "Laptop-Nix-SB";

  imports = with modules; [
    ./hardware.nix
    bluetooth
    boot
    audio
    locale
    user
    shell
    hyprland
    kde
    wifi
    kanata
  ];

  # Overwrite default logind behaviour
  services.logind.extraConfig = ''
    # Lid behavior is handled by Hyprland
    HandleLidSwitch=ignore
  '';

  # PowerManagement
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "ondemand";
  };
}
