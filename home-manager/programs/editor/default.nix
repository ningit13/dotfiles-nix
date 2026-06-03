{ lib, enableDE, ... }:
{
  imports = [
    ./nixvim
  ]
  ++ lib.optionals enableDE [
    ./vscode
  ];
}
