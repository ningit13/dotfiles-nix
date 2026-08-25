{ pkgs, lib, ... }:
{
  imports =
    lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      ./brave
      ./firefox
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [ ];
}
