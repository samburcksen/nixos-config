{ pkgs, ... }:

{
  # Required by Kanata
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  programs.kanata.enable = true;
}
