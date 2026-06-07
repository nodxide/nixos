{ pkgs, ... }:

{
  # Disable automatic fwupd refresh (recommended for most users):
  services.fwupd.enable = true; # Keep fwupd itself enabled
  # Make manual refresh easier:
  environment.systemPackages = with pkgs; [ fwupd ];

  systemd.services.fwupd-refresh = {
    enable = false;
  };


}
