{ ... }:

{
  users.users.sburcksen = {
    isNormalUser = true;
    description = "Sam Burcksen";
    extraGroups = [
      "wheel"
      "input" # input and uinput required by kanata
      "uinput"
    ];
  };

}
