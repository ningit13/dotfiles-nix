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
    enableDE = false;
  };

  modules = [
    nixvim.homeModules.nixvim
    ../../nix
    ../../home-manager/misc
    ../../home-manager/programs/editor
    ../../home-manager/programs/lang
    ../../home-manager/programs/terminal
    ../../home-manager/programs/tools/direnv
    ../../home-manager/programs/tools/eza
    ../../home-manager/programs/tools/fd
    ../../home-manager/programs/tools/fzf
    ../../home-manager/programs/tools/jq
    ../../home-manager/programs/tools/lazygit
    ../../home-manager/programs/tools/ripgrep
    ../../home-manager/programs/tools/yazi
    ../../home-manager/programs/tools/zoxide
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
