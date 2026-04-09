{ inputs, ... }:
let
  inherit (inputs)
    nixpkgs
    nix-darwin
    home-manager
    nixvim
    ;

  profile = import ./profile.nix;
  inherit (profile) system username;

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];
  };

in
nix-darwin.lib.darwinSystem {
  inherit pkgs;
  specialArgs = {
    inherit profile;
  };

  modules = [
    ../../nix-darwin
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        users.${username} = {
          imports = [
            ../../home-manager
            ../../home-manager/graphical.nix
          ];
        };
        sharedModules = [
          nixvim.homeModules.nixvim
        ];
        extraSpecialArgs = {
          inherit profile;
        };
      };
    }
  ];
}
