{
  description = "nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    flake-parts,
    treefmt-nix,
    ...
  }@inputs:

  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];

    imports = [
      treefmt-nix.flakeModule
    ];

    flake =
      { ... }:
      {
        homeConfigurations = {
          myHomeConfig = inputs.home-manager.lib.homeManagerConfiguration;
        };
      };

    perSystem =
      {
        pkgs,
        ...
      }:
      {
        treefmt = {
          projectRootFile = "flake.nix";
          programs = {
            nixfmt.enable = true;
          };
        };

        apps = {
          update-flake = {
            type = "app";
            program = toString (
              pkgs.writeShellScript "update-flake" ''
                set -e
                echo "Updating flake..."
                nix flake update --show-trace
                echo "flake update complete!"
              ''
            );
          };

          update-home-manager = {
            type = "app";
            program = toString (
              pkgs.writeShellScript "update-home-manager" ''
                set -e
                echo "Updating home-manager..."
                nix run nixpkgs#home-manager -- switch --flake .#myHomeConfig --show-trace
                echo "home-manager update complete!"
              ''
            );
          };
        };
      };
  };
}
