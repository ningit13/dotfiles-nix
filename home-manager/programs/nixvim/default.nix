{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    package = pkgs.neovim;
  };
}
