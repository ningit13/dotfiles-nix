{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;
  xdg.configFile."waybar/style.css".source = ./style.css;
  xdg.configFile."waybar/modules" = {
    recursive = true;
    source = ./modules;
  };
  xdg.configFile."waybar/colors" = {
    recursive = true;
    source = ./colors;
  };

  home.packages = with pkgs; [
    pavucontrol
  ];
}
