{ pkgs, profile, ... }:
let
  inherit (profile) username;
in
{
  users.users.${username} = {
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
