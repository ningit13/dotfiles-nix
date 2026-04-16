{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-vscode.remote-explorer
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.remote-server
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-containers
      editorconfig.editorconfig
      jnoortheen.nix-ide
      anthropic.claude-code
      github.vscode-github-actions
    ];
  };
}
