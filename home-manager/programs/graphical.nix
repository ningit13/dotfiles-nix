{ lib, config, ... }:
{
  programs.zsh.initContent = lib.mkOrder 1500 '''
    export SSH_AUTH_SOCK=${config.home.homeDirectory}/.bitwarden-ssh-agent.sock
  ''';

  imports = [
    ./alacritty
    ./alacritty-theme
    ./bitwarden
    ./brave
  ];
}
