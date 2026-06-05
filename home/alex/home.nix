{ username, stateVersion, ... }:

{
  imports = [
    ./git.nix
    ./packages.nix
    ./shell
    ./terminal
  ];

  home = {
    inherit username stateVersion;

    homeDirectory = "/home/${username}";
  };

  programs.home-manager.enable = true;
}
