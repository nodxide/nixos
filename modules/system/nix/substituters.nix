{ ... }:

{
  nix.settings = {
    extra-substituters = [
      "https://cache.garnix.io"
      "https://hydra.nix-community.org"
    ];

    extra-trusted-public-keys = [
      # Garnix
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
}
