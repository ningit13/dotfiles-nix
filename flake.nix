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
    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.brew-api.follows = "brew-api";
    };
    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };
    mac-app-util.url = "github:hraban/mac-app-util";

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
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

      flake = {
        darwinConfigurations = {
          mac = import ./hosts/mac { inherit inputs; };
        };
        homeConfigurations = {
          linux = import ./hosts/linux { inherit inputs; };
          linux-server = import ./hosts/linux-server { inherit inputs; };
          wsl = import ./hosts/wsl { inherit inputs; };
          work = import ./hosts/work { inherit inputs; };
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
                  HOST="''${1:-linux-server}"
                  echo "updating home-manager for host: $HOST..."
                  nix  run nixpkgs#home-manager -- switch --flake .#"$HOST" --show-trace
                  echo "home-manager update complete!"
                ''
              );
            };
          };
        };
    };
}
