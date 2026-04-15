{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    package = pkgs.neovim;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    imports = [
      ./common
      ./plugins
    ];
  };
}
