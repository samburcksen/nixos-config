{ pkgs, ... }:

{
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  users.groups.uinput = {};

  environment.systemPackages = [
    pkgs.kanata
  ];
}
