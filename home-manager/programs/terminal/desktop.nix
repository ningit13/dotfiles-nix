{ profile, ... }:
{
  imports = [
    ./alacritty
  ];

  programs.zsh.localVariables = {
    SSH_AUTH_SOCK = "${profile.homeDirectory}/.bitwarden-ssh-agent.sock";
  };
}
