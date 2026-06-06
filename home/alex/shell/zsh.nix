_:

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
    '';
  };
}
