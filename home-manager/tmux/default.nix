{ pkgs, ... }:
{
  # Requirements
  # git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
  programs.tmux.enable = true;
  xdg.configFile.tmux.source = ./config/tmux;
  xdg.configFile.tmux-powerline.source = ./config/tmux-powerline;
}
