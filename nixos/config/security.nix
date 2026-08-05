{
  # Enable swaylock PAM service for authentication
  security.pam.services.swaylock = { };
  security.pam.services.gdm.enableGnomeKeyring = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
