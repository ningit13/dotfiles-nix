{ lib, config, ... }:
{
  linux = {
    imports = [
      ./alacritty
      ./alacritty-theme
      ./bitwarden
      ./brave
      ./obsidian
    ];
  };

  mac = {
    imports = [
      ./alacritty
      ./alacritty-theme
    ];
  };
}
