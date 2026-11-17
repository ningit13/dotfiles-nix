{
  pkgs,
  lib,
  profile,
  ...
}:
{
  imports =
    lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      ./bitwarden
      ./obsidian
      ./slack
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [ ];

  programs.zsh.localVariables = {
    SSH_AUTH_SOCK = "${profile.homeDirectory}/.bitwarden-ssh-agent.sock";
  };
}
