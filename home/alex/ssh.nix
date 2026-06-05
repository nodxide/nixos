{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "*" = {
        IdentityFile = "~/.ssh/id_ed25519";
        ServerAliveInterval = 63;
        ServerAliveCountMax = 5;
      };
    };

    extraConfig = ''
      AddKeysToAgent yes
      HashKnownHosts yes
    '';
  };
}
