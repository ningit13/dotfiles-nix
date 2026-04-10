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
        useGlobalPkgs = true;
        useUserPackages = false;

        users.${username} = {
          imports = [
            ../../home-manager
            ../../home-manager/graphical.nix
          ];
        };
        sharedModules = [
          nixvim.homeModules.nixvim
          {
            nixpkgs.overlays = [
              inputs.neovim-nightly-overlay.overlays.default
            ];
          }
        ];
        extraSpecialArgs = {
          inherit profile;
        };
      };
    }
  ];
}
