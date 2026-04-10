{
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.zsh.shellAliases = {
    l = "eza -la";
    ls = "eza";
    la = "eza -a";
    lt = "eza --tree";
  };
}
