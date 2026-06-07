_:

{
  services.gnome = {
    # Disable conflicting GNOME SSH agent:
    gcr-ssh-agent.enable = false;
  };
}
