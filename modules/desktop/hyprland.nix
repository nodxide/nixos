{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland";
    __GLX_VENDOR_LIBRARY_NAME = "mesa";
    GBM_BACKEND = "amdgpu";
  };

  environment.systemPackages = with pkgs; [
    nwg-look
    qt6Packages.qt6ct
    qt6.qtwayland
    libsForQt5.qt5ct
  ];

  # Polkit Authentication Agent (for GUI apps asking for password):
  systemd.user.services.hyprland-polkit = {
    description = "Hyprland Polkit Authentication Agent";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = "1";
    };
  };
}
