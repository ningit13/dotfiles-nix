{
  pkgs,
  lib,
  enableDE,
  ...
}:
{
  imports = [
    ./editor
    ./lang
    ./terminal
    ./tools
  ]
  ++ lib.optionals (enableDE && pkgs.stdenv.isLinux) [
    ./apps
    ./browser
  ];
}
