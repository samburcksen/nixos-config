{ ... }:

{
  # Enable networking via IWD
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    IPv6 = {
      Enabled = true;
    };
    Settings = {
      AutoConnect = true;
    };
  };

  networking.networkmanager.enable = false;
}
