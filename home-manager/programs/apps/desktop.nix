{ pkgs, lib, ... }:
{
  imports =
    lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      ./bitwarden
      ./obsidian
      ./slack
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [ ];
}
