{
  pkgs,
  config,
  ...
}:
{
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
      curl
    ];
  };

  imports = [
    ./misc/nix
    ./programs/neovim
    ./services/nix-gc
  ];
}
