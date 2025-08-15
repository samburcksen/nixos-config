{ pkgs, modules, ... }:

{
  networking.hostName = "Nas-Nix-SB";

  imports = with modules; [
    ./hardware.nix
    boot
    locale
    user
    shell
  ];

  # PowerManagement
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "ondemand";
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    xfsprogs
    htop
    smartmontools
    hdparm
    iperf3
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings = {
    PermitRootLogin = "yes";
  };

  virtualisation.docker.enable = true;
}
