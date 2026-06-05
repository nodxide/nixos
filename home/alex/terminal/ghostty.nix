{ ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Catppuccin Mocha";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;
      window-padding-x = 10;
      window-padding-y = 10;
      cursor-style = "block";
      scrollback-limit = 10000;
      copy-on-select = true;
      shell-integration = "zsh";
      mouse-hide-while-typing = true;
    };
  };
}
