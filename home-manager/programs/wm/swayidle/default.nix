{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 180;
        command = "${pkgs.brightnessctl}/bin/brightnessctl --save --quiet set 30%";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl --restore --quiet";
      }
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock";
      }
      {
        timeout = 600;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events.before-sleep = "${pkgs.procps}/bin/pidof swaylock || ${pkgs.swaylock}/bin/swaylock";
  };

  home.packages = with pkgs; [
    brightnessctl
  ];
}
