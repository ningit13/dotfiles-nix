{ pkgs, ... }:
{
  nix = {
    enable = true;
    package = pkgs.nix;
  };
}
