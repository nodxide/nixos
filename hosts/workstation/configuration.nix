{ vars, ... }:

{
  imports = [
    # Desktop module:
    ../../modules/desktop/niri.nix
    ../../modules/desktop/sessionVariables.nix
    ../../modules/desktop/xdg.nix

    # Services module:
    ../../modules/services/flatpak.nix
    ../../modules/services/gnome.nix
    ../../modules/services/ssh.nix

    # System module:
    ../../modules/system/nix/core.nix
    ../../modules/system/nix/substituters.nix
    ../../modules/system/users/alex.nix
    ../../modules/system/boot.nix
    ../../modules/system/fonts.nix
    ../../modules/system/fwupd.nix
    ../../modules/system/locales.nix
    ../../modules/system/networking.nix
    ../../modules/system/stylix.nix

    # Hardware:
    ./hardware-configuration.nix
  ];

  system.stateVersion = vars.stateVersion;
}
