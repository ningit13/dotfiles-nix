{ inputs }:
let
  inherit (inputs)
    home-manager
    ;
  inherit (inputs) nixpkgs;

  username = "kohei";
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];
  };

in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  modules = [
    ../../home-manager
    ../../home-manager/wsl.nix
    {
      home = {
        username = username;
        homeDirectory = "/home/${username}";
      };
    }
  ];
}
