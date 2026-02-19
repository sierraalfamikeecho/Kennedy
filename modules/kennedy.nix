{
  config,
  pkgs,
  ...
}: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  # mango, ly and waybar
  services.desktopManager.cosmic.enable = true;
  services.displayManager.ly.enable = true;
  # Bluetooth
  hardware.bluetooth.enable = true;
}
