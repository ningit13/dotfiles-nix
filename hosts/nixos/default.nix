{ inputs, ... }:
let
  inherit (inputs)
    nixpkgs
    home-manager
    nixvim
    nix4vscode
    ;

  profile = import ./profile.nix;
  inherit (profile) system username;

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      nix4vscode.overlays.default
    ];
  };

in
pkgs.lib.nixosSystem {
  inherit pkgs;
  specialArgs = {
    inherit profile;
  };

  modules = [
    ../../nixos
    ./hardware-configuration.nix

    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        users.${username} = {
          imports = [
            ../../home-manager
            ../../home-manager/desktop.nix
          ];
        };
        sharedModules = [
          nixvim.homeModules.nixvim
        ];
        extraSpecialArgs = {
          inherit profile pkgs;
        };
      };
    }
  ];
}
