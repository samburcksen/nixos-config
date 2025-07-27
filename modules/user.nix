{ ... }:

{
  users.users.sburcksen = {
    isNormalUser = true;
    description = "Sam Burcksen";
    extraGroups = [
      "wheel"
      "input"
      "uinput"
    ];
  };

  users.users.guest = {
    isNormalUser = true;
    description = "Guest";
  };
}
