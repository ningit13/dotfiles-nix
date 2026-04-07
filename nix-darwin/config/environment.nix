{ profile, config, ... }:
{
  environment.etc."zshenv" = {
    enable = true;
    text = ''
      export ZDOTDIR=${profile.homeDirectory}/.config/zsh
      export ZSH_DISABLE_COMPFIX=true;
    '';
  };
}
