{ ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    initLua = "";
    plugins = import ./plugins.nix;
  };
}
