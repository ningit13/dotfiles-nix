{ pkgs, lib, ... }:
{
  imports = [
    ./apps/desktop.nix
    ./browser/desktop.nix
    ./editor/desktop.nix
    ./terminal/desktop.nix
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    ./wm/desktop.nix
  ];
}
