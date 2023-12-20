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

    "*background" =  "#292522";
    "*foreground" =  "#ECE1D7";
    "*color0"  = "#34302C";
    "*color1"  = "#BD8183";
    "*color2"  = "#78997A";
    "*color3"  = "#E49B5D";
    "*color4"  = "#7F91B2";
    "*color5"  = "#B380B0";
    "*color6"  = "#7B9695";
    "*color7"  = "#C1A78E";
    "*color8"  = "#867462";
    "*color9"  = "#D47766";
    "*color10" = "#85B695";
    "*color11" = "#EBC06D";
    "*color12" = "#A3A9CE";
    "*color13" = "#CF9BC2";
    "*color14" = "#89B3B6";
    "*color15" = "#ECE1D7";

    "st.font" = "BlexMono Nerd Font:style=Medium:size=11";
    "st.alpha" = "1.00";
    "st.background" =  "#292522";
    "st.foreground" =  "#ECE1D7";
    "st.color0"  = "#34302C";
    "st.color1"  = "#BD8183";
    "st.color2"  = "#78997A";
    "st.color3"  = "#E49B5D";
    "st.color4"  = "#7F91B2";
    "st.color5"  = "#B380B0";
    "st.color6"  = "#7B9695";
    "st.color7"  = "#C1A78E";
    "st.color8"  = "#867462";
    "st.color9"  = "#D47766";
    "st.color10" = "#85B695";
    "st.color11" = "#EBC06D";
    "st.color12" = "#A3A9CE";
    "st.color13" = "#CF9BC2";
    "st.color14" = "#89B3B6";
    "st.color15" = "#ECE1D7";

    # "hydra.alpha" =        223;
    # "hydra.border" =       "#393939";
    # "hydra.white" =        "#dde1e6";
    # "hydra.lightblue" =    "#3ddbd9";
    # "hydra.yellow" =       "#F9E2AF";
    # "hydra.orange" =       "#FFAB91";
    # "hydra.purple" =       "#ff7eb6";
    # "hydra.green" =        "#42be65";
    # "hydra.red" =          "#ee5396";
    # "hydra.blue" =         "#82cfff";
    # "hydra.gray" =         "#393939";
    # "hydra.darkgray" =     "#000000";
    # "hydra.black" =        "#0f0f0f";
    # "hydra.buttoncolor" =  "#FFAB91";

    # "dmenu.font" = 		    "Torus Pro:style=Regular:size=12";
    # "dmenu.normfg" = 		"#dde1e6";
    # "dmenu.normbg" = 		"#161616";
    # "dmenu.selfg" = 		"#161616";
    # "dmenu.selbg" = 		"#ee5396";
    # "dmenu.selhlfg" = 		"#ffffff";
    # "dmenu.selhlbg" = 		"#ee5396";
    # "dmenu.normhlfg" = 	    "#ee5396";
    # "dmenu.normhlbg" = 	    "#161616";
  };
}
