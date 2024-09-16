{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xsettingsd
    nitrogen
  ];

  services.xidlehook = {
    enable = true;
    detect-sleep = true;
    not-when-audio = true;
    not-when-fullscreen = true;
    timers = [
      {
        delay = 120;
        command = "brightnessctl -s && brightnessctl s 0'";
        canceller = "brightnessctl -r";
      }
      {
        delay = 160;
        command = "lock";
        canceller = "brightnessctl -r";
      }
      {
        delay = 180;
        command = "xset dpms force off";
      }
    ];
  };

  services.unclutter = {
    enable = true;
    timeout = 15;
  };

  xsession = {
    enable = true;
    numlock.enable = true;
  };

  services.fusuma = {
    enable = true;
    package = pkgs.fusuma;
    extraPackages = with pkgs; [ coreutils xdotool ];
    settings = {
      threshold = {
        swipe = 0.1;
      };
      interval = {
        swipe = 0.7;
      };
      swipe = {
        "3" = {
          left = {
            command = "xdotool key super+shift+Right";
          };
          right = {
            command = "xdotool key super+shift+Left";
          };
        };
      };
    };
  };
}
