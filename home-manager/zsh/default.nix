{ config, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    history.path = "${config.xdg.stateHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      custom = "${config.programs.zsh.dotDir}/customizations";
      plugins = [
        "git"
        "docker"
        "tmux"
      ];
      theme = "my-theme";
    };
  };

  home.file."${config.programs.zsh.oh-my-zsh.custom}/themes/my-theme.zsh-theme" = {
    source = ./themes/my-theme.zsh-theme;
  };
}
