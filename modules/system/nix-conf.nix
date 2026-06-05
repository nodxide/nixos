{ vars, ... }:

{
  nix = {
    settings = {
      allowed-users = [ "${vars.username}" ];
      trusted-users = [
        "@admin"
        "${vars.username}"
        "root"
      ];
      substituters = [
        "https://cache.nixos.org"
        # "https://nix-community.cachix.org"
      ];

      # trusted-public-keys = [
      #   ...
      # ];

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      auto-optimise-store = true;
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    optimise = {
      automatic = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
}
