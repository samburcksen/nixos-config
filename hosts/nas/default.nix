{ pkgs, modules, ... }:

{
  networking.hostName = "nas";

  imports = with modules; [
    ./hardware.nix
    boot
    locale
    user
    shell
    docker
    monitoring-utils
  ];

  # PowerManagement
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "ondemand";
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings = {
    PermitRootLogin = "yes";
  };
}
