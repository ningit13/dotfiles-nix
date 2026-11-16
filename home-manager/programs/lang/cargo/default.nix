{ config, ... }:
{
  programs.cargo = {
    enable = true;
    cargoHome = "${config.xdg.dataHome}/cargo";
  };
}
