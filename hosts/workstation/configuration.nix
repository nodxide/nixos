{ vars, ...}:

{
  imports = [
    ../../modules/desktop
    ../../modules/services
    ../../modules/system
    ./hardware-configuration.nix
  ];

  system.stateVersion = vars.stateVersion;
}
