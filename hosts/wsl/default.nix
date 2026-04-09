{ inputs }:
let
  inherit (inputs) nixpkgs home-manager nixvim;

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
    nixvim.homeModules.nixvim
    ../../nix
    ../../home-manager
    ../../home-manager/wsl.nix
    { home.homeDirectory = homeDirectory; }
  ];
}
