{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # Theming & Qt/GTK tools
  environment.systemPackages = with pkgs; [
    nwg-look # GTK theme manager
    qt6Packages.qt6ct # Qt6 theme manager
    qt6.qtwayland
    libsForQt5.qt5ct # Qt5 theme manager
    adwaita-icon-theme
    gnome-themes-extra
  ];
}
