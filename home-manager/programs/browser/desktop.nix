{ pkgs, lib, ... }:
{
  imports =
    lib.optionals pkgs.stdenv.isLinux [
      ./brave
      ./firefox
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [ ];
}
