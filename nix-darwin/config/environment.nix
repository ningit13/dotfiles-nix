{ ... }:
{
  environment.etc."zshenv" = {
    enable = true;
    text = ''
      export ZSH_DISABLE_COMPFIX=true;
    '';
  };
}
