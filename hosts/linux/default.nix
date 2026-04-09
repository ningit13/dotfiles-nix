{ inputs }:
let
  inherit (inputs) nixpkgs home-manager;

  profile = import ./profile.nix;
  inherit (profile) system homeDirectory;

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
  extraSpecialArgs = {
    inherit profile;
  };

  modules = [
    pkgs.nixvim.homeManagerModules.nixvim
    ../../nix
    ../../home-manager
    ../../home-manager/graphical.nix
    { home.homeDirectory = homeDirectory; }
  ];
}
