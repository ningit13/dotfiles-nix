{ pkgs, lib, ... }:
{
  imports =
    lib.optionals pkgs.stdenv.isLinux [
      ./brave
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [ ];
}
