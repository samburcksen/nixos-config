{ pkgs, ... }:

{
  #  services.displayManager.sddm = {
  #enable = true;
  #wayland.enable = true;
  #};
  services.desktopManager.plasma6.enable = true;

  users.users.guest = {
    isNormalUser = true;
    description = "Guest";
    packages = [
      pkgs.firefox
    ];
  };
}
