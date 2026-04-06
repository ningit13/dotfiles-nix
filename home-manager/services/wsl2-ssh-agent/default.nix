{ pkgs, ... }:
{
  home.packages = with pkgs; [ wsl2-ssh-agent ];
}
