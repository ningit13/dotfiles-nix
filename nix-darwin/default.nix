{ profile, ... }:
let
  inherit (profile) username homeDirectory;
in
{
  users.users.${username}.home = homeDirectory;

  imports = [
    ./config/fonts.nix
    ./config/homebrew.nix
    ./config/nix.nix
    ./config/programs.nix
    ./config/system.nix
  ];
}
