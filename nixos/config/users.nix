{ pkgs, profile, ... }:
let
  inherit (profile) username;
in
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
