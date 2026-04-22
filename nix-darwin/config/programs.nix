{ profile, lib, ... }:
{
  programs = {
    zsh = {
      enableCompletion = false;
      histFile = "";
      promptInit = "";
      variables = {
        "SSH_AUTH_SOCK" = "/Users/${profile.username}/.bitwarden-ssh-agent.sock";
      };
    };
  };
}
