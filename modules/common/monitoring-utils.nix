{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    smartmontools
    hdparm
    iperf3
  ];
}
