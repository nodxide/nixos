_:

{
  programs.ghostty = {
    enable = true;

    settings = {
      title = " ";
      theme = "Catppuccin Mocha";
      font-size = 13;
      window-padding-x = 11;
      window-padding-y = 11;
      cursor-style = "block";
      scrollback-limit = 10000;
      copy-on-select = true;
      shell-integration = "zsh";
      mouse-hide-while-typing = true;
    };
  };
}
