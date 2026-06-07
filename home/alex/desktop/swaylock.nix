{ pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;

    settings = {
      # Visuals:
      image = "~/Wallpapers/pixel-car.png"; # change to your wallpaper path
      scaling = "fill";
      clock = true;
      indicator = true;
      indicator-radius = 120;
      indicator-thickness = 12;
      timestr = "%H:%M";
      datestr = "%A, %d %B";
      font = "JetBrainsMono Nerd Font";
      font-size = 24;
      ignore-empty-password = false;
      show-failed-attempts = true;
      fade-in = 0.2;

      # Colors:
      color = "1e1e2eF0";
      inside-color = "1e1e2e00";
      inside-clear-color = "a6e3a100";
      inside-caps-lock-color = "f9e2af00";
      inside-ver-color = "89b4fa00";
      inside-wrong-color = "f38ba800";
      line-color = "1e1e2e";
      line-clear-color = "a6e3a1";
      line-caps-lock-color = "f9e2af";
      line-ver-color = "89b4fa";
      line-wrong-color = "f38ba8";
      ring-color = "45475a";
      ring-clear-color = "a6e3a1";
      ring-caps-lock-color = "f9e2af";
      ring-ver-color = "89b4fa";
      ring-wrong-color = "f38ba8";
      text-color = "cdd6f4";
      text-clear-color = "a6e3a1";
      text-caps-lock-color = "f9e2af";
      text-ver-color = "89b4fa";
      text-wrong-color = "f38ba8";
      key-hl-color = "a6e3a1";
      bs-hl-color = "f38ba8";
    };
  };
}
