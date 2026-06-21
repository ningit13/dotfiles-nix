{ pkgs, lib, ... }:
{
  imports = [
    ./programs/desktop.nix
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    ./fonts
  ];
}
