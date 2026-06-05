{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      share = true;
    };

    initContent = ''
      # eza (modern ls replacement):
      alias ls="eza --icons --group-directories-first"
      alias ll="eza -lah --icons --group-directories-first --git"
      alias la="eza -a --icons --group-directories-first"
      alias lt="eza --tree --icons --level=2"
      alias lta="eza --tree --all --icons --level=2"

      # safer defaults:
      alias rm="rm -Iv"
      alias cp="cp -iv"
      alias mv="mv -iv"
      alias mkdir="mkdir -p"

      # GRC — colored command output:
      alias ping="grc ping -c 5"
      alias traceroute="grc traceroute"
      alias dig="grc dig"
      alias netstat="grc netstat"
      alias ss="grc ss"
      alias ip="grc ip -c"
      alias journalctl="grc journalctl"
      alias ps="grc ps aux"
      alias df="grc df -h"
      alias mount="grc mount"
      alias free="grc free -h"
      alias lsblk="grc lsblk"

      # System:
      alias rebuild#workstation="sudo nixos-rebuild switch --flake ~/nixos/#workstation"
      alias testbuild#workstation="sudo nixos-rebuild test --flake ~/nixos/#workstation"
      alias bootbuild#workstation="sudo nixos-rebuild boot --flake ~/nixos/#workstation"
      alias hm="home-manager switch --flake ~/nixos/home/alex"
      alias update="nix flake update ~/nixos"
      alias check="nix flake check ~/nixos"
      alias gcroot="sudo nix-collect-garbage -d"
      alias optimise="sudo nix-store --optimise"
    '';
  };
}
