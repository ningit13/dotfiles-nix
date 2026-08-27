{ pkgs, ... }:
{
  home.packages = with pkgs; [
    networkmanagerapplet
    networkmanager_dmenu
  ];

  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = fuzzel
    list_saved = True

    [editor]
    terminal = ghostty
  '';
}
