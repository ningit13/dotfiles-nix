{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-vscode.remote-explorer
      ms-vscode.remote-ssh
      ms-vscode.remote-ssh-edit
      editorconfig.editorconfig
      jnoortheen.nix-ide
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-containers
      ms-vscode.remote-server
      Anthropic.claude-code
    ];
  };
}
