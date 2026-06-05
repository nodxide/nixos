{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      noto-fonts-color-emoji
      noto-fonts
      noto-fonts-cjk-sans
    ];

    fontconfig = {
      enable = true;

      antialias = true;

      hinting = {
        enable = true;
        style = "slight";
      };

      # Better LCD rendering:
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };

      defaultFonts = {
        sansSerif = [
          "JetBrains Mono"
          "Noto Sans"
        ];

        serif = [
          "JetBrains Mono"
          "Noto Serif"
        ];

        monospace = [
          "JetBrains Mono Nerd Font"
          "JetBrains Mono"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
