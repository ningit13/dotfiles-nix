{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode-remote.remote-containers
        ms-azuretools.vscode-containers
        editorconfig.editorconfig
        jnoortheen.nix-ide
        github.vscode-github-actions
        anthropic.claude-code
      ];

      userSettings = {
        "editor.fontFamily" = "'CaskaydiaMono Nerd Font Mono'";
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "boundary";

        "terminal.integrated.fontFamily" = "'CaskaydiaMono Nerd Font Mono'";

        "claudeCode.preferredLocation" = "panel";
      };
    };
  };
}
