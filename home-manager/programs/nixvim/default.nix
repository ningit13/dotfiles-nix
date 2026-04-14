{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    package = pkgs.neovim;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };

    opts = {
      number = true;
    };

    imports = [
      ./globals.nix
      ./keymap.nix
      ./lsp.nix
      ./plugins.nix
    ];
  };
}
