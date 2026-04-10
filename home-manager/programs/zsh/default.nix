{ config, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    history.path = "${config.xdg.stateHome}/zsh/history";

    initContent = ''
      # Ignore insecure completion-dependent directories
      compaudit() { return 0; }
    '';

    oh-my-zsh = {
      enable = true;
      custom = "${config.programs.zsh.dotDir}/customizations";
      plugins = [
        "eza"
        "fzf"
        "docker"
        "git"
        "tmux"
      ];
      theme = "my-theme";
    };
  };

  home.file."${config.programs.zsh.oh-my-zsh.custom}/themes/my-theme.zsh-theme" = {
    source = ./customizations/themes/my-theme.zsh-theme;
  };
}
