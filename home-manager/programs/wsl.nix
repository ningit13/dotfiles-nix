{ pkgs, ... }:
{
  programs.zsh.initContent = ''
    eval $(${pkgs.wsl2-ssh-agent}/bin/wsl2-ssh-agent)
  '';
}
