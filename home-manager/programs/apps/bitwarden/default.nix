{ pkgs, profile, ... }:
{
  home.packages = with pkgs; [ bitwarden-desktop ];

  programs.zsh.localVariables = {
    SSH_AUTH_SOCK = "${profile.homeDirectory}/.bitwarden-ssh-agent.sock";
  };
}
