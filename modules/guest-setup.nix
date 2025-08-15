{ pkgs, ... }:

{
  #  services.displayManager.sddm = {
  #enable = true;
  #wayland.enable = true;
  #};
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
  ];

  users.users.guest = {
    isNormalUser = true;
    description = "Guest";
  };
}
