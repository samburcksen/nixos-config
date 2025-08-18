{ pkgs, ... }:

{
  users.users.sburcksen = {
    description = "Sam Burcksen";
    isNormalUser = true;
    createHome = true;
    home = "/home/sburcksen";
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "input" # input and uinput required by kanata
      "uinput"
    ];
  };
}
