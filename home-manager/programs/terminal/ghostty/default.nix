{ pkgs, ... }:
{
  programs.ghostty.enable = true;
  programs.ghostty.package =
    if pkgs.stdenv.hostPlatform.isLinux then pkgs.ghostty else pkgs.ghostty-bin;
}
