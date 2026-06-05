{ pkgs, unstable, ... }:

{
  home.packages =
    (with pkgs; [
      # Core CLI & Shell:
      curl
      eza
      ffmpeg
      git
      grc
      p7zip
      tree
      unzip
      unrar
      wget
      zoxide

      # Search & Productivity:
      bat
      fzf
      ripgrep

      # System Monitoring & Utils:
      btop
      fastfetch
      htop
      ncdu
      duf

      # Nix(base) Tooling:
      nixd
      nixfmt

      # Desktop & GUI Applications:
      firefox
      kitty
      localsend
      nemo
      obsidian
      telegram-desktop
      vesktop
      wofi
      vlc
    ])
    ++ (with unstable; [
      # Bleeding-edge Development Tools:
      vscode
    ]);
}
