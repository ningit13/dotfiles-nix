{ profile }:
{
  system = {
    stateVersion = 6;
    primaryUser = profile.username;

    defaults = {
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = false;
        "com.apple.swipescrolldirection" = false;
      };

      dock = {
        launchanim = false;
        autohide = true;
        show-recents = false;
        orientation = "bottom";
      };
    };
  };
}
