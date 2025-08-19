{ lib, ... }:

{
  xdg.configFile = {
    "nvim".source = ./dotfiles/nvim;
    "fish".source = ./dotfiles/fish;
    "waybar".source = ./dotfiles/waybar;
    "wlogout".source = ./dotfiles/wlogout;
    "mako".source = ./dotfiles/mako;
    "kanata".source = ./dotfiles/kanata;

    # "hypr".source = ./dotfiles/hypr;
  }
  // (
    let
      paths = lib.attrNames (builtins.readDir ./dotfiles/hypr);
      configs = builtins.map (name: { "hypr/${name}".source = ./dotfiles/hypr/${name}; }) paths;
    in
    builtins.foldl' (a: b: a // b) { } configs
  );
}
