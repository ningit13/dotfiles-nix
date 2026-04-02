{
  pkgs,
  config,
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

  xdg = {
    enable = true;

    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    cacheHome = "${config.home.homeDirectory}/.cache";
  };

  home = {
    stateVersion = "25.11";

    packages = with pkgs; [
      git
      curl
    ];
  };

  imports = [
    ./zsh
    ./tmux
  ];
}
