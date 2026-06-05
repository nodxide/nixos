{ ... }:

{
  services.openssh = {
    enable = true;

    # Security hardening:
    settings = {
      PermitRootLogin = "no"; # Disable root login
      PasswordAuthentication = false; # Use keys only
      PubkeyAuthentication = true;
      PermitEmptyPasswords = false;
      AllowUsers = [ "alex" ];
    };

    # Extra security:
    ports = [ 22 ];
    openFirewall = true;
  };

  # Fail2Ban protection:
  services.fail2ban.enable = true;

  # SSH Agent (for easier key management):
  programs.ssh.startAgent = true;
}
