{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brewCasks.brave-browser
    brewCasks.bitwarden
    brewCasks.visual-studio-code # configured at home-manager level
    brewCasks.rectangle
    brewCasks.obsidian
    brewCasks.claude
    brewCasks.proton-mail
    brewCasks.slack
  ];
}
