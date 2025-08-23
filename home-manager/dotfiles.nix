{ lib, ... }:

{
  xdg.configFile = {
    "nvim".source = ./dotfiles/nvim;
    "fish".source = ./dotfiles/fish;
    "waybar".source = ./dotfiles/waybar;
    "wlogout".source = ./dotfiles/wlogout;
    "kanata".source = ./dotfiles/kanata;
  }
  //
    # Include all files in hypr/ one by one to not make the whole dir write protected
    (
      let
        paths = lib.attrNames (builtins.readDir ./dotfiles/hypr);
        configs = builtins.map (name: { "hypr/${name}".source = ./dotfiles/hypr/${name}; }) paths;
      in
      builtins.foldl' (a: b: a // b) { } configs
    );
}
