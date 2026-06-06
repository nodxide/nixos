_:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };

      listener = [
        # Dim screen after 2 minutes:
        {
          timeout = 120;
          on-timeout = "brightnessctl -s set 15";
          on-resume = "brightnessctl -r";
        }

        # Lock screen after 8 minutes:
        {
          timeout = 480;
          on-timeout = "loginctl lock-session";
        }

        # Turn off screen (DPMS) after 12 minutes:
        {
          timeout = 720;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        # Suspend after 35 minutes:
        {
          timeout = 2100;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
