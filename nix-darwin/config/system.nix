{ profile, config, ... }:
{
  system = {
    stateVersion = 6;
    primaryUser = profile.username;

    defaults = {
      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
      };
    };
  };
}
