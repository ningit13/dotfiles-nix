{ ... }:
{
  linux = {
    imports = [
      ./fonts
      (./programs/graphical.nix).linux
    ];
  };

  mac = {
    imports = [
      (./programs/graphical.nix).mac
    ];
  };
}
