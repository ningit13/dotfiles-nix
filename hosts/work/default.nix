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
    ../../home-manager/misc
    ../../home-manager/programs/eza
    ../../home-manager/programs/fd
    ../../home-manager/programs/fzf
    ../../home-manager/programs/ripgrep
    ../../home-manager/programs/yazi
    ../../home-manager/services
    { home.homeDirectory = homeDirectory; }
  ];
}
