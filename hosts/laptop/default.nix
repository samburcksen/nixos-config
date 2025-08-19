{ modules, ... }:

{
  networking.hostName = "Laptop-Nix-SB";

  imports = with modules; [
    ./hardware.nix
    ./guest-setup.nix
    ./kanata.nix
    desktop.default
    common.default
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
