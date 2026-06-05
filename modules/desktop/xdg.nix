{ pkgs, ... }:

{
  xdg = {
    portal = {
      enable = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];

      config = {
        common.default = [
          "hyprland"
          "gtk"
        ];
        hyprland.default = [
          "hyprland"
          "gtk"
        ];
        gtk = {
          default = [ "gtk" ];
        };
      };
    };
  };

  # Useful XDG tools:
  environment.systemPackages = with pkgs; [
    xdg-user-dirs
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
