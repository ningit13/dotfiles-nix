{ lib, enableDE, ... }:
{
  imports = [
    ./tmux
    ./zsh
  ]
  ++ lib.optionals enableDE [
    ./alacritty
    ./alacritty-theme
  ];
}
