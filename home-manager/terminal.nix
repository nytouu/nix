{ pkgs, ... }:
{
	home.packages = with pkgs; [
		(st.overrideAttrs (oldAttrs: rec {
			src = fetchFromGitHub {
				owner = "nytouu";
				repo = "st";
				rev = "c3f09a428e67cc353ea12fddeebec21a7bda8fb2";
				sha256 = "1r09fca8yqgq1v5sp8ahmrr9sc9gjwa97i4vi75wi9k6y36bwi6x";
			};
			buildInputs = oldAttrs.buildInputs ++ [ xorg.libXinerama xorg.libXcursor harfbuzz gd ];
		}))
		(tabbed.overrideAttrs (oldAttrs: rec {
			src = fetchFromGitHub {
				owner = "nytouu";
				repo = "tabbed";
				rev = "e45c7817ec53c6ad4e8e59c999f2b6132bd52062";
				sha256 = "1hv3xbybw2fr20di1plw964rff7j0x4mbb1ghg80ygg39qdpj5di";
			};
			buildInputs = oldAttrs.buildInputs;
		}))
	];

/*
	programs.kitty = {
		enable = true;
		settings = {
			background 	= "#1d2021";
			foreground 	= "#ebdbb2";
			color0 		= "#0d0e0f";
			color8 		= "#32302f";
			color1  	= "#cc241d";
			color9  	= "#fb4934";
			color2  	= "#689d6a";
			color10 	= "#8ec07c";
			color3  	= "#fabd2f";
			color11 	= "#eebd35";
			color4  	= "#458588";
			color12 	= "#7fa2ac";
			color5  	= "#b16286";
			color13 	= "#d4879c";
			color6  	= "#3ddbd9";
			color14 	= "#3ddbd9";
			color7  	= "#665c54";
			color15 	= "#e7d7ad";

			font_size	= "10.0";
		
			# symbol_map = "U+f101-U+f208 nonicons";
			window_padding_width        = "2";
			tab_bar_style               = "custom";
			tab_separator               = "";
			tab_fade                    = "0 0 0 0";
			tab_title_template          = "{fmt.fg._665c54}{fmt.bg.default}  {index}:{f'{title[:6]}…{title[-6:]}' if title.rindex(title[-1]) + 1 > 25 else title}{' []' if layout_name == 'stack' else ''} ";
			active_tab_title_template   = "{fmt.fg._458588}{fmt.bg.default}  {index}:{f'{title[:6]}…{title[-6:]}' if title.rindex(title[-1]) + 1 > 25 else title}{' []' if layout_name == 'stack' else ''} ";
			tab_bar_edge                = "bottom";
			tab_bar_align               = "left";
			tab_bar_margin_width        = "0.0";
			tab_bar_margin_height       = "4.0 4.0";
			active_tab_font_style       = "bold-italic";
			inactive_tab_font_style     = "normal";
			tab_bar_min_tabs            = "2";
			tab_activity_symbol         = "none";
			bell_on_tab                 = "no";
			enable_audio_bell           = "no";

			clear_all_shortcuts         = "no";
			confirm_os_window_close = 0;
		};
			keybindings = {
				"ctrl+shift+j" = "next_tab";
				"ctrl+shift+k" = "previous_tab";
				"ctrl+shift+x" = "close_tab";
				"ctrl+shift+enter" = "new_tab";
			};
		};
	programs.tmux = {
		enable = false;
		clock24 = true;
		mouse = true;
		plugins = with pkgs.tmuxPlugins; [
			sensible
		];
	};
	programs.alacritty = {
		enable = false;
		settings = {
			font.size = 11;
	            cursor.style = "Beam";
	
	            padding = {
	                x = 4;
	                y = 4;
	            };
	
	            env = {
	                "TERM" = "xterm-256color";
	            };
	
			colors = {
				primary = {
					background 	= "#161616";
					foreground 	= "#dde1e6";
				};
				normal = {
					black 	= "#262626";
					red 	= "#ee5396";
					green	= "#42be65";
					yellow	= "#F9E2AF";
					blue	= "#82cfff";
					magenta	= "#be95ff";
					cyan	= "#3ddbd9";
					white	= "#525252";
	
				};
				bright = {
					black 	= "#393939";
					red 	= "#ee5396";
					green	= "#42be65";
					yellow	= "#F9E2AF";
					blue	= "#82cfff";
					magenta	= "#be95ff";
					cyan	= "#3ddbd9";
					white	= "#525252";
				};
			};
		};
	};
	*/
}
