{
  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  # Disable wireless support via wpa_supplicant.
  networking.wireless.enable = false;
}
