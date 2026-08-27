{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.hostPlatform.isLinux then pkgs.ghostty else pkgs.ghostty-bin;
    installVimSyntax = true;

    settings = {
      theme = "GitHub Dark";
      background-opacity = 0.9;
      maximize = true;
      font-family = "CaskaydiaCove Nerd Font Propo";
      font-size = 13;

      shell-integration-features = "no-cursor";
      cursor-style = "block";
      cursor-style-blink = false;

      right-click-action = "copy-or-paste";
    };
  };
}
