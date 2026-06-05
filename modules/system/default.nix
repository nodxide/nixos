{ ... }:

{
  imports = [
    ./nix/core.nix
    ./nix/substituters.nix
    ./boot.nix
    ./fonts.nix
    ./locales.nix
    ./networking.nix
    ./stylix.nix
    ./users.nix
  ];
}
