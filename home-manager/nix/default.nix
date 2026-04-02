{ pkgs, ... }:
{
  nix = {
    enable = true;
    package = pkgs.nix;
    settings.experimental-features =
    [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
    };
  };
}
