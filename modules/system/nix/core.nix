{ vars, ... }:
{
  nix = {
    settings = {
      # Users who can interact with the Nix daemon:
      allowed-users = [
        "${vars.username}"
        "root"
        "@wheel"
      ];

      # Users trusted to set extra substituters, override settings, etc.:
      trusted-users = [
        "${vars.username}"
        "root"
        "@wheel"
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://cache.garnix.io"
        "https://hydra.nix-community.org"
      ];

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Performance & UX:
      auto-optimise-store = true;
      warn-dirty = false;
      keep-outputs = true; # Keep build outputs (great for dev)
      keep-derivations = true; # Keep derivations (helps with GC)
      sandbox = true; # Security: build in sandbox when possible
    };

    # Garbage collection:
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 25d";
    };

    # Automatic store optimisation:
    optimise = {
      automatic = true;
    };
  };

  # Allow unfree packages (e.g. NVIDIA drivers, Steam, etc.):
  nixpkgs.config.allowUnfree = true;

  # Limit how many old boot generations to keep:
  boot.loader.systemd-boot.configurationLimit = 8;
}
