{ pkgs, ... }:
let
  claude-code = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      publisher = "anthropic";
      name = "claude-code";
      version = "2.1.96";
      sha256 = "sha256-CxJ9NJXqHAa9n0pFJERZQhSIggqa4Wc63Yg+0NGedCU=";
    };
  };
  # macOS: VSCode is managed by Homebrew; wrap the Homebrew binary to avoid
  # building pkgs.vscode from nixpkgs (fails due to 7-Zip symlink extraction).
  vscodePkg =
    if pkgs.stdenv.isDarwin then
      pkgs.writeShellScriptBin "code" ''exec /opt/homebrew/bin/code "$@"''
    else
      pkgs.vscode;
in
{
  programs.vscode = {
    enable = true;
    package = vscodePkg;
    profiles.default = {
      extensions =
        (with pkgs.vscode-extensions; [
          ms-vscode.remote-explorer
          ms-vscode-remote.remote-ssh
          ms-vscode-remote.remote-ssh-edit
          ms-vscode-remote.remote-containers
          ms-azuretools.vscode-containers
          editorconfig.editorconfig
          jnoortheen.nix-ide
          github.vscode-github-actions
        ])
        ++ [ claude-code ];

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
