{ pkgs, fetchurl, ... }:
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
        delay = 180;
        command = "lock";
      }
      {
        delay = 360;
        command = "systemctl suspend";
      }
    ];
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

  xresources.properties = {
    "*.font" = "Torus Pro";
    "Xft.dpi" = 96;
    "XTerm*renderFont" = true;
    "XTerm*faceName" = "xft: MartianMono Nerd Font";
    "XTerm*faceSize" = 13;
    "Xft.hinting"    = true;
    "Xft.hintstyle"  = "hintfull";

    "Xcursor.theme" = "Notwaita-Black";
    "Xcursor.size" = 24;

    "*background" =  "#1D1D1D";
    "*foreground" =  "#FFFFFF";
    "*color0"  =     "#262626";
    "*color8"  =     "#393939";
    "*color1"  =     "#F66151";
    "*color9"  =     "#F66151";
    "*color2"  =     "#57E389";
    "*color10" =     "#57E389";
    "*color3"  =     "#F9F06B";
    "*color11" =     "#F9F06B";
    "*color4"  =     "#62A0EA";
    "*color12" =     "#62A0EA";
    "*color5"  =     "#DC8ADD";
    "*color13" =     "#DC8ADD";
    "*color6"  =     "#93DDC2";
    "*color14" =     "#93DDC2";
    "*color7"  =     "#525252";
    "*color15" =     "#525252";

    "dwm.border" =       "#525252";
    "dwm.white" =        "#FFFFFF";
    "dwm.lightblue" =    "#93DDC2";
    "dwm.yellow" =       "#F9F06B";
    "dwm.orange" =       "#FFAB91";
    "dwm.purple" =       "#ff7eb6";
    "dwm.green" =        "#57E389";
    "dwm.red" =          "#F66151";
    "dwm.blue" =         "#62A0EA";
    "dwm.gray" =         "#393939";
    "dwm.darkgray" =     "#000000";
    "dwm.black" =        "#0f0f0f";
    "dwm.buttoncolor" =  "#FFAB91";


    "st.font" = "MartianMono Nerd Font:style=Medium:size=10:autohint=true";
    "st.alpha" = "1.00";
    "st.background" = "#1D1D1D";
    "st.foreground" = "#FFFFFF";
    "st.color0"     = "#262626";
    "st.color8"     = "#393939";
    "st.color1"     = "#F66151";
    "st.color9"     = "#F66151";
    "st.color2"     = "#57E389";
    "st.color10"    = "#57E389";
    "st.color3"     = "#F9F06B";
    "st.color11"    = "#F9F06B";
    "st.color4"     = "#62A0EA";
    "st.color12"    = "#62A0EA";
    "st.color5"     = "#DC8ADD";
    "st.color13"    = "#DC8ADD";
    "st.color6"     = "#93DDC2";
    "st.color14"    = "#93DDC2";
    "st.color7"     = "#525252";
    "st.color15"    = "#525252";
  };
}
