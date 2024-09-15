{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mpc-cli
    ytmdl
    zscroll
    playerctl
    # youtube-music
    monophony
  ];

  services.playerctld.enable = true;
  services.mpd-mpris = {
    enable = false;
  };
  services.mpd = {
    enable = false;
    extraConfig = ''
      save_absolute_paths_in_playlists	"yes"
      metadata_to_use	"artist,album,title,track,name,genre,date,composer,performer,disc"
      auto_update	"yes"
      follow_outside_symlinks	"yes"
      follow_inside_symlinks		"yes"

      input {
          plugin "curl"
      }

      input {
          plugin "tidal"
          enabled "no"
      }

      input {
          plugin "qobuz"
          enabled "no"
      }

      decoder {
          plugin "wildmidi"
          enabled "no"
      }

      decoder {
          plugin "hybrid_dsd"
          enabled "no"
      }

      audio_output {
          type		"pulse"
          name		"Pulse Output"
      }

      audio_output {
          type		"fifo"
          name		"fifo Visualizer"
          path		"/tmp/mpd.fifo"
          format		"44100:16:2"
      }
    '';
  };

  services.mpd-discord-rpc = {
    enable = false;
  };

  programs.ncmpcpp = {
    enable = true;
    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "l"; command = "next_column"; }
      { key = "h"; command = "previous_column"; }
    ];
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
      taglibSupport = true;
    };
    settings = {
      ncmpcpp_directory = "${config.home.homeDirectory}/.config/ncmpcpp";
      ignore_leading_the = true;
      external_editor = "nvim";
      message_delay_time = 1;
      playlist_disable_highlight_delay = 2;
      autocenter_mode = "yes";
      centered_cursor = "yes";
      allow_for_physical_item_deletion = "no";
      lines_scrolled = "0";
      follow_now_playing_lyrics = "yes";
      lyrics_fetchers = "musixmatch";

      # visualizer
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "mpd_visualizer";
      visualizer_type = "spectrum";
      visualizer_look = "●●";
      visualizer_color = "blue, green";

      # appearance
      colors_enabled = "yes";
      playlist_display_mode = "classic";
      user_interface = "classic";
      volume_color = "white";

      # window
      song_window_title_format = "Music";
      statusbar_visibility = "no";
      header_visibility = "no";
      titles_visibility = "no";
      # progress bar
      progressbar_look = "━━━";
      progressbar_color = "black";
      progressbar_elapsed_color = "black";

      # song list
      song_status_format = "$7%t";
      song_list_format = "$(008)%t$R  $(247)%a$R$5  %l$8";
      song_columns_list_format = "(53)[blue]{tr} (45)[blue]{a}";

      current_item_prefix = "$b$2| ";
      current_item_suffix = "$/b$5";

      now_playing_prefix = "$b$5| ";
      now_playing_suffix = "$/b$5";

      song_library_format = "{{%a - %t} (%b)}|{%f}";

      # colors
      main_window_color = "blue";

      current_item_inactive_column_prefix = "$b$5";
      current_item_inactive_column_suffix = "$/b$5";

      color1 = "white";
      color2 = "blue";
    };
  };
}
