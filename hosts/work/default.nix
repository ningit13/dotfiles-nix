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
    ../../home-manager/programs/cli-tools/claude-code
    ../../home-manager/programs/cli-tools/direnv
    ../../home-manager/programs/cli-tools/eza
    ../../home-manager/programs/cli-tools/fd
    ../../home-manager/programs/cli-tools/fzf
    ../../home-manager/programs/cli-tools/jq
    ../../home-manager/programs/cli-tools/lazygit
    ../../home-manager/programs/cli-tools/ripgrep
    ../../home-manager/programs/cli-tools/yazi
    ../../home-manager/programs/cli-tools/zoxide
    ../../home-manager/programs/cloud
    ../../home-manager/programs/lang/python
    ../../home-manager/programs/terminal/tmux
    ../../home-manager/programs/terminal/zsh
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
