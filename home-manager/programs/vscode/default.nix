{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-vscode.remote-explorer
      ms-vscode.remote-ssh
      ms-vscode.remote-ssh-edit
      editorconfig.editorconfig
    ];
  };
}
