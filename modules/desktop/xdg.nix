{ pkgs, lib, ... }:

{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # General fallback (file chooser, etc.)
      xdg-desktop-portal-gnome # Required for screen sharing / screencasting on Niri
    ];

    config = lib.mkForce {
      common.default = [ "gtk" "gnome" ];

      niri = {
        default = [ "gtk" "gnome" ];           # ← we force our preferred order
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
        "org.freedesktop.impl.portal.ScreenCast"  = [ "gnome" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };

      gtk.default = [ "gtk" ];
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xdg-utils
  ];
}
