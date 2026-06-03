{ inputs, ... }:
let
  inherit (inputs)
    nixpkgs
    home-manager
    nixvim
    ;

  profile = import ../profile.nix;
  inherit (profile) system username;

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

in
nixpkgs.lib.nixosSystem {
  inherit pkgs;
  specialArgs = {
    inherit profile;
  };

  modules = [
    ../../nixos
    nixvim.nixosModules.nixvim
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useUserPackages = false;

        users.${username} = import ../../home-manager;
        sharedModules = [
          nixvim.homeModules.nixvim
        ];
        extraSpecialArgs = {
          inherit profile pkgs;
          enableDE = true;
        };
      };
    }
  ];
}
