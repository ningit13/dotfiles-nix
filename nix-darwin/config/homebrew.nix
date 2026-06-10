{ ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      extraFlags = [ "--force-cleanup" ];
    };
    casks = [
      "brave-browser"
      "bitwarden"
      "rectangle"
      "obsidian"
      "claude"
      "proton-mail"
      "slack"
    ];
  };
}
