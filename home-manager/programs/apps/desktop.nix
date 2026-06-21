{ pkgs, lib, ... }:
{
  imports =
    lib.optionals pkgs.stdenv.isLinux [
      ./bitwarden
      ./obsidian
      ./slack
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [ ];
}
