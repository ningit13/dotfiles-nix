{ pkgs, ... }:
{
  home.packages = with pkgs; [ ydiff ];
}
