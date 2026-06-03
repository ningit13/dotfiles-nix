{
  pkgs,
  lib,
  enableDE,
  ...
}:
lib.mkIf (enableDE && pkgs.stdenv.hostPlatform.isLinux) {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];
}
