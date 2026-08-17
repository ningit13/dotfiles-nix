{ pkgs, ... }:
{
  systemd.services.swayosd-libinput-backend = {
    description = "SwayOSD Libinput Backend";
    documentation = [ "https://github.com/ErikReider/SwayOSD" ];
    wantedBy = [ "graphical.target" ];
    partOf = [ "graphical.target" ];
    after = [ "graphical.target" ];

    serviceConfig = {
      Type = "dbus";
      BusName = "org.erikreider.swayosd";
      ExecStart = "${pkgs.swayosd}/bin/swayosd-libinput-backend";
      Restart = "on-failure";
    };
  };

  services.dbus.packages = [ pkgs.swayosd ];
  services.udev.packages = [ pkgs.swayosd ];
}
