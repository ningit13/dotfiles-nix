{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brewCasks.brave-browser # configured at home-manager level
    brewCasks.bitwarden # configured at home-manager level
    brewCasks.visual-studio-code # configured at home-manager level
    brewCasks.rectangle
    brewCasks.obsidian # configured at home-manager level
    brewCasks.claude
    brewCasks.proton-mail
    brewCasks.slack
  ];
}
