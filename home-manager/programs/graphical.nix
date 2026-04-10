{ lib, config, ... }:
{
  linux = {
    imports = [
      ./alacritty
      ./alacritty-theme
      ./bitwarden
      ./brave
      ./obsidian
      ./vscode
    ];
  };

  mac = {
    imports = [
      ./alacritty
      ./alacritty-theme
    ];
  };
}
