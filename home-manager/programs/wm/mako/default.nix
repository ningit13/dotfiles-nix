{
  services.mako.enable = true;
  services.mako.settings = {
    # Global options
    font = "CaskaydiaCove Nerd Font Propo 12";
    background-color = "#1b2023ee";
    text-color = "#acb0d0";
    progress-color = "over #3cae34ee";
    width = 300;
    height = 100;
    default-timeout = 5000;
    layer = "overlay";

    # - border options
    border-color = "#f9c993ee";
    border-size = 1;
    border-radius = 8;

    # - icon options
    icons = true;
    max-icon-size = 36;
    icon-location = "left";
    icon-border-radius = 0;

    "urgency=low" = {
      default-timeout = 3000;
      border-color = "#54ff44ee";
    };
    "urgency=normal" = {
      default-timeout = 5000;
      border-color = "#46ceffee";
    };
    "urgency=critical" = {
      default-timeout = 0;
      border-color = "#ff4646ee";
    };
  };
}
