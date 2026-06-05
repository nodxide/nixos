{ ... }:

{
  programs.throne = {
    enable = true;

    tunMode = {
      enable = true;

      # Whether to install a setuid wrapper for the core binary.
      # The NixOS module usually handles this automatically when tunMode.enable = true,
      # but explicitly setting it ensures it works.
      setuid = true;
    };
  };
}
