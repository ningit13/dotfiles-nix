{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brewCasks.brave-browser
    brewCasks.bitwarden
    brewCasks.rectangle
    brewCasks.obsidian
    brewCasks.claude
    brewCasks.proton-mail
    brewCasks.slack
  ];
}
