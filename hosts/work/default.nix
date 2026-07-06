{ inputs }:
let
  inherit (inputs) nixpkgs home-manager nixvim;

  profile = import ./profile.nix;
  inherit (profile) system homeDirectory;

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;
  extraSpecialArgs = {
    inherit profile;
  };

  modules = [
    nixvim.homeModules.nixvim
    ../../linux
    ../../home-manager/misc
    ../../home-manager/programs/cli-tools
    ../../home-manager/programs/cloud
    ../../home-manager/programs/lang/python
    ../../home-manager/programs/terminal/tmux
    ../../home-manager/programs/terminal/zsh
    ../../home-manager/programs/vcs/lazygit
    ../../home-manager/programs/vcs/ydiff
    ../../home-manager/services
    {
      home.homeDirectory = homeDirectory;
      programs.zsh.initContent = pkgs.lib.mkOrder 1500 ''
        # Set up proxy
        source ~/setup-files/.set_proxy.sh
        alias swp="source ~/setup-files/switch_proxy.sh"
      '';
    }
  ];
}
