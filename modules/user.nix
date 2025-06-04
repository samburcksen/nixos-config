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
}
