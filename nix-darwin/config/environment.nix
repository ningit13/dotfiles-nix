{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brewCasks.brave-browser
    brewCasks.bitwarden
    brewCasks.visual-studio-code
    brewCasks.rectangle
    brewCasks.obsidian
  ];
}
