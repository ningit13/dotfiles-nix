{ pkgs, ... }:
{
  programs.ghostty.enable = true;
  programs.ghostty.package = if pkgs.stdenv.isLinux then pkgs.ghostty else pkgs.ghostty-bin;
}
