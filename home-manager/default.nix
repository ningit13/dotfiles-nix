{
  pkgs,
  ...
}:
{
  nix = {
    enable = true;
    package = pkgs.nix;
    settings.experimental-features =
    [
      "nix-command"
      "flakes"
    ];
  };

  home = {
    stateVersion = "25.11";

    packages = with pkgs; [
      zsh
    ];
  };

  programs = {
    zsh = {
      enable = true;
    };
  };
}
