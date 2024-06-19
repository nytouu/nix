{ pkgs, ... }:

{
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
					command = "xdotool key super+Right";
				};
				right = {
					command = "xdotool key super+Left";
				};
			};
		};
	};
  };

  xresources.properties = {
    "*.font" = "Torus Pro";
    "Xft.dpi" = 96;
    "XTerm*renderFont" = true;
    "XTerm*faceName" = "xft: JetBrains Mono";
    "XTerm*faceSize" = 13;
    #"Xcursor.theme" = "Bibata-Original-Ice";
    #"Xcursor.size" = 24;

    "*background" =  "#1D1D1D";
    "*foreground" =  "#FFFFFF";
    "*color0"  =     "#262626";
    "*color1"  =     "#393939";
    "*color2"  =     "#F66151";
    "*color3"  =     "#F66151";
    "*color4"  =     "#57E389";
    "*color5"  =     "#57E389";
    "*color6"  =     "#F9F06B";
    "*color7"  =     "#F9F06B";
    "*color8"  =     "#62A0EA";
    "*color9"  =     "#62A0EA";
    "*color10" =     "#DC8ADD";
    "*color11" =     "#DC8ADD";
    "*color12" =     "#93DDC2";
    "*color13" =     "#93DDC2";
    "*color14" =     "#525252";
    "*color15" =     "#525252";

    "st.font" = "BlexMono Nerd Font:style=Medium:size=11";
    "st.alpha" = "1.00";
    "st.background" = "#1D1D1D";
    "st.foreground" = "#FFFFFF";
    "st.color0"     = "#262626";
    "st.color1"     = "#393939";
    "st.color2"     = "#F66151";
    "st.color3"     = "#F66151";
    "st.color4"     = "#57E389";
    "st.color5"     = "#57E389";
    "st.color6"     = "#F9F06B";
    "st.color7"     = "#F9F06B";
    "st.color8"     = "#62A0EA";
    "st.color9"     = "#62A0EA";
    "st.color10"    = "#DC8ADD";
    "st.color11"    = "#DC8ADD";
    "st.color12"    = "#93DDC2";
    "st.color13"    = "#93DDC2";
    "st.color14"    = "#525252";
    "st.color15"    = "#525252";

    "hydra.border" =       "#525252";
    "hydra.white" =        "#FFFFFF";
    "hydra.lightblue" =    "#93DDC2";
    "hydra.yellow" =       "#F9F06B";
    "hydra.orange" =       "#FFAB91";
    "hydra.purple" =       "#ff7eb6";
    "hydra.green" =        "#57E389";
    "hydra.red" =          "#F66151";
    "hydra.blue" =         "#62A0EA";
    "hydra.gray" =         "#393939";
    "hydra.darkgray" =     "#000000";
    "hydra.black" =        "#0f0f0f";
    "hydra.buttoncolor" =  "#FFAB91";

    "dmenu.font" = 		    "Torus Pro:style=Regular:size=12";
    "dmenu.normfg" = 		"#FFFFFF";
    "dmenu.normbg" = 		"#000000";
    "dmenu.selfg" = 		"#000000";
    "dmenu.selbg" = 		"#F66151";
    "dmenu.selhlfg" = 	"#ffffff";
    "dmenu.selhlbg" = 	"#F66151";
    "dmenu.normhlfg" = 	"#F66151";
    "dmenu.normhlbg" = 	"#000000";
  };
}
