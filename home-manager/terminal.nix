{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "nytouu";
        repo = "st";
        rev = "b2089a2c514d6264379bb1c84e7655b90f45e7d1";
        sha256 = "0nqivk9vrqvq92p2h2l72rr21hggk3gjj1fp06icql169vjwr551";
      };
      buildInputs = oldAttrs.buildInputs ++ [
        xorg.libXinerama
        xorg.libXcursor
        harfbuzz
        gd
      ];
    }))
    (tabbed.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "nytouu";
        repo = "tabbed";
        rev = "e4966ae6c74a3e6f0b11f3b821318d95e89cee16";
        sha256 = "0gy825dqi882a7wddr36dii10pv5nxqg3n1mwnxyg6pna59skcwf";
      };
      buildInputs = oldAttrs.buildInputs;
    }))
  ];

  programs.kitty = {
    enable = true;
    settings = {
      font_size = "12.0";
      font_family = "Liga SFMono Nerd Font Medium";
      # bold_font = "auto";
      # italic_font = "BlexMono Nerd Font Italic";
      # bold_italic_font = "auto";
      background_opacity = "0.95";

      cursor_trail = "3";
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = "2";
			cursor_shape = "beam";

      undercurl_style = "thick-sparse";

      symbol_map = "U+f101-U+f208 nonicons";
      window_padding_width = "14";
      tab_bar_style = "custom";
      tab_separator = "";
      tab_fade = "0 0 0 0";
      tab_title_template = "{fmt.fg._665c54}{fmt.bg.default}  {index}:{f'{title[:6]}…{title[-6:]}' if title.rindex(title[-1]) + 1 > 25 else title}{' []' if layout_name == 'stack' else ''} ";
      active_tab_title_template = "{fmt.fg._458588}{fmt.bg.default}  {index}:{f'{title[:6]}…{title[-6:]}' if title.rindex(title[-1]) + 1 > 25 else title}{' []' if layout_name == 'stack' else ''} ";
      tab_bar_edge = "bottom";
      tab_bar_align = "left";
      tab_bar_margin_width = "0.0";
      tab_bar_margin_height = "4.0 4.0";
      active_tab_font_style = "bold-italic";
      inactive_tab_font_style = "normal";
      tab_bar_min_tabs = "2";
      tab_activity_symbol = "none";
      bell_on_tab = "no";
      enable_audio_bell = "no";

      clear_all_shortcuts = "no";
      confirm_os_window_close = 0;
			allow_remote_control = "yes";
    };

    extraConfig = ''
      	modify_font cell_height 6px
      	modify_font cell_width 105%
    '';

    keybindings = {
      "ctrl+shift+j" = "next_tab";
      "ctrl+shift+k" = "previous_tab";
      "ctrl+shift+x" = "close_tab";
      "ctrl+shift+enter" = "new_tab";
    };
  };
}
