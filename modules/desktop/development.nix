{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    gnumake
    cmake
    gdb
    python3
    rustup

    obsidian
  ];
}
