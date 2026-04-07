{ profile, ... }:
let
  inherit (profile) username homeDirectory;
in
{
  users.users.${username}.home = homeDirectory;

  imports = [
    ./system
  ];
}
