{ profile, ... }:
{
  system = {
    stateVersion = 6;
    primaryUser = profile.username;

    defaults = {
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      universalaccess = {
        reduceMotion = true;
        reduceTransparency = true;
      };

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = false;
        AppleShowAllExtensions = true;
        "com.apple.swipescrolldirection" = false;
      };

      dock = {
        launchanim = false;
        autohide = true;
        show-recents = false;
        orientation = "bottom";
        mineffect = "scale";
        minimize-to-application = true;
        tilesize = 40;
      };
    };
  };
}
