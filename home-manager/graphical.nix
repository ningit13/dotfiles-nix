{
  linux = [
    ./fonts
    (import ./programs/graphical.nix).linux
  ];

  mac = (import ./programs/graphical.nix).mac;
}
