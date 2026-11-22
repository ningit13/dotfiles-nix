{
  colorschemes.github-theme = {
    enable = true;
    settings = {
      options = {
        transparent = true;
      };
    };
    luaConfig.content = ''
      vim.cmd.colorscheme("github_dark_colorblind")
    '';
  };
}
