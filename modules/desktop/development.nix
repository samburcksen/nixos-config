{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    gnumake
    cmake
    gdb
    cargo
    rustup
    python3
  ];
}
