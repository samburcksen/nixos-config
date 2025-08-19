{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      lua-language-server
      nil
      clang-tools
      rust-analyzer
    ];
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim".source = ./dotfiles/nvim;
}
