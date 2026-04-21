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
    ../../nix
    ../../home-manager/misc
    ../../home-manager/programs/direnv
    ../../home-manager/programs/eza
    ../../home-manager/programs/fd
    ../../home-manager/programs/fzf
    ../../home-manager/programs/jq
    ../../home-manager/programs/lazygit
    ../../home-manager/programs/python
    ../../home-manager/programs/ripgrep
    ../../home-manager/programs/tmux
    ../../home-manager/programs/yazi
    ../../home-manager/programs/zoxide
    ../../home-manager/programs/zsh
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
