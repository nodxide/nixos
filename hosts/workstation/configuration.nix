{ ... }:

{
  imports = [
    ../../modules/desktop
    ../../modules/services
    ../../modules/system
    ./hardware-configuration.nix
  ];

  programs.hyprland = {
    enable = true;

    xwayland.enable = true;
  };

  system.stateVersion = "26.05";
}
