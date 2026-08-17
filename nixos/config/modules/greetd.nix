{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd niri-session";
        user = "greeter";
      };
    };
    useTextGreeter = true;
  };
  # Use tuigreet as greeter for greetd
  environment.systemPackages = with pkgs; [
    tuigreet
  ];

  systemd.user.services.niri.enableDefaultPath = false;
  security.pam.services.greetd.enableGnomeKeyring = true;
}
