{ inputs }:
let
  inherit (inputs)
    home-manager
    ;
  inherit (inputs) nixpkgs;

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
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;
  extraSpecialArgs = {
    inherit profile;
  };

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
