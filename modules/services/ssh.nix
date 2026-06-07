{ vars, ... }:
{
  services.openssh = {
    enable = true;

    # Security hardening:
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      PubkeyAuthentication = true;
      PermitEmptyPasswords = false;
      AllowUsers = [ "${vars.username}" ];
    };

    ports = [ 22 ];
    openFirewall = true;

    # Only put valid sshd_config options here
    extraConfig = ''
      # Optional: More security
      MaxAuthTries 3
      LoginGraceTime 20
    '';
  };

  # Fail2Ban protection:
  services.fail2ban.enable = true;

  # SSH Agent (for easier key management):
  programs.ssh.startAgent = true;

  # Client-side SSH config:
  programs.ssh = {
    extraConfig = ''
      AddKeysToAgent yes
      IdentityFile ~/.ssh/id_ed25519
      ServerAliveInterval 60
    '';
  };
}
