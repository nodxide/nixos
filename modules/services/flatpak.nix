_:

{
  services.flatpak = {
    enable = true;

    # Auto-update flatpaks during system rebuild:
    update.onActivation = true;

    packages = [
      "com.github.tchx84.Flatseal"
    ];
  };
}
