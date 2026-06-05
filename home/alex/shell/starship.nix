{ ... }:

{
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      scan_timeout = 20;

      format = ''
        $os$directory$git_branch$git_status$fill$nix_shell$python$lua$golang$docker_context$kubernetes$package$line_break$character
      '';

      # OS:
      os = {
        disabled = false;
        style = "bold blue";
        format = "[$symbol]($style)";
      };

      os.symbols.NixOS = " ";

      # Directory:
      directory = {
        style = "bold green";
        format = "[ $path ]($style)";
        truncation_length = 4;
        truncate_to_repo = true;
        read_only = "  ";
      };

      # Git branch:
      git_branch = {
        symbol = " ";
        style = "bold yellow";
        format = "[$symbol$branch ]($style)";
      };

      # Git status:
      git_status = {
        style = "bold green";
        format = "([$all_status $ahead_behind]($style))";
        conflicted = "[󰞇](red)";
        up_to_date = "[󰄬](green)";
        untracked = "[󰞋 \${count}](blue)";
        stashed = "[󰏗 \${count}](cyan)";
        modified = "[󰏫 \${count}](yellow)";
        staged = "[󰐕 \${count}](green)";
        renamed = "[󰑕 \${count}](blue)";
        deleted = "[󰍶 \${count}](red)";
        ahead = "[󰁝 \${count}](green)";
        behind = "[󰁅 \${count}](red)";
        diverged = "[󰹹 ⇡\${ahead_count}⇣\${behind_count}](purple)";
      };

      # Prompt character:
      character = {
        success_symbol = "[](bold blue)";
        error_symbol = "[x](bold red)";
        vimcmd_symbol = "[](bold green)";
      };

      # Languages:
      nix_shell = {
        symbol = " ";
        style = "bold blue";
        format = "[$symbol$version ]($style)";
      };

      python = {
        symbol = "󰌠 ";
        style = "bold yellow";
        format = "[$symbol$version ]($style)";
      };

      lua = {
        symbol = "󰢱 ";
        style = "bold blue";
        format = "[$symbol$version ]($style)";
      };

      golang = {
        symbol = "󰟓 ";
        style = "bold blue";
        format = "[$symbol$version ]($style)";
      };

      # Containers / infra:
      docker_context = {
        symbol = "󰡨 ";
        style = "bold blue";
        format = "[$symbol$context ]($style)";
      };

      kubernetes = {
        symbol = "󱃾 ";
        style = "bold blue";
        format = "[$symbol$context ]($style)";
      };

      # Package version:
      package = {
        symbol = "󰏖 ";
        style = "bold purple";
        format = "[$symbol$version ]($style)";
      };
    };
  };
}
