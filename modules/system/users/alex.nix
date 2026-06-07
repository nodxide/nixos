{ pkgs, ... }:

{
  users = {
    users.alex = {
      isNormalUser = true;
      description = "Main User Account";

      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "video"
        "input"
      ];

      shell = pkgs.zsh;
    };
  };

  programs.zsh.enable = true;

  security.sudo = {
    enable = true;

    extraRules = [
      {
        groups = [ "wheel" ];
        commands = [
          {
            command = "${pkgs.systemd}/bin/reboot";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${pkgs.systemd}/bin/poweroff";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/systemctl";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
