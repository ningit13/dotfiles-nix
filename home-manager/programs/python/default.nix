{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python314.withPackages (
      ps: with ps; [
        libtmux # required for tmux-window-name (plugin)
      ]
    ))
  ];
}
