{ inputs }:
let
  inherit (inputs)
    nix-darwin
    home-manager
    ;
  inherit (inputs) nixpkgs;

  username = "kohei";
  system = "aarch64-darwin";
in
nix-darwin.lib.darwinSystem {
  modules = [
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        # useUserPackages = true;
        users."${username}" = ../../home-manager;
        home = {
          username = username;
          homeDirectory = "/home/${username}";
        };
      };
    };
  ];
}
