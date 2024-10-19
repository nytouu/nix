{ inputs, config, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "MartianMono Nerd Font:size=11";
				line-height = 17;
      };

      mouse = {
        hide-when-typing = "yes";
      };

			colors = {
				alpha = 0.9;
			};
    };
  };

  home.packages = with pkgs; [
    hyprpaper
    wl-clipboard
    wf-recorder
    rofi-wayland
    wayshot
    swappy
    hypridle
    hyprlock
  ];

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = false;
      splash = true;
      splash_offset = 2.0;

      preload = "~/pics/wallpaper.png";

      wallpaper = [
        ",~/pics/wallpaper.png"
      ];
    };
  };

  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs.hyprlandPlugins; [
      borders-plus-plus
      csgo-vulkan-fix
    ];

    settings = {
      monitor = ",preferred,auto,1";
      input = {
        kb_layout = "fr";
        # kb_variant =
        # kb_model =
        # kb_options =
        # kb_rules =
        numlock_by_default = true;
        accel_profile = "flat";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };

        sensitivity = -0.1;
      };

      general = {
        gaps_in = 12;
        gaps_out = 24;
        border_size = 1;
        "col.active_border" = "rgba(777777ee) rgba(444444ee) 90deg";
        "col.inactive_border" = "rgba(333333ee)";

        layout = "master";
        allow_tearing = true;
      };

      decoration = {
        inactive_opacity = 1.00;
        rounding = 12;

        blur = {
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = false;
        };


        # shadow_range = 12
        # shadow_render_power = 0.5 
        drop_shadow = true;
        shadow_range = 30;
        shadow_render_power = 3;
        "col.shadow" = "rgba(0000003e)";
      };

      animations = {
        enabled = true;

        # bezier = myBezier, 0.05, 0.9, 0.1, 1.0

        # animation = windows, 1, 7, myBezier
        # animation = windowsOut, 1, 7, default, popin 80%
        # animation = border, 1, 10, default
        # animation = fade, 1, 7, default
        # animation = workspaces, 1, 6, default

        bezier = [
          "md3_standard, 0.2, 0.0, 0, 1.0"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "win10, 0, 0, 0, 1"
          "gnome, 0, 0.85, 0.3, 1"
          "funky, 0.46, 0.35, -0.2, 1.2"
        ];

        animation = [
          "windows, 1, 2, gnome, popin 80%"
          "windowsOut, 1, 2, gnome, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 4, md3_decel, slide"
        ];
      };

      dwindle = {
        pseudotile = false;
        preserve_split = true;
      };

      master = {
        new_status = "master";
        no_gaps_when_only = false;
        new_on_top = true;
        mfact = 0.50;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 500;
        workspace_swipe_create_new = true;
      };

      misc = {
        disable_hyprland_logo = false;
        vfr = true;
        vrr = false;
        enable_swallow = true;
        mouse_move_enables_dpms = true;
        focus_on_activate = true;
        # animate_manual_resizes = true
        # animate_mouse_windowdragging = true
      };

      windowrule = [
        "float, ^(Connman-gtk)$"
        "float, ^(Blueberry.py)$"
        "float, ^(Galculator)$"
        "float, ^(Engrampa)$"
        "float, ^(File-roller)$"
        "float, ^(pulsemixer)$"
        "float, ^(calcurse)$"
        "float, ^(ncmpcpp)$"
        "workspace 1, ^(steam)$"
        "workspace 4, ^(firefox)$"
        "workspace 4, ^(librewolf)$"
        "workspace 6, ^(discord)$"
        "workspace 5, ^(osu!.exe)$"
        "workspace 5, ^(osu!)$"
        "pin, title:^(Picture-in-Picture)$"
      ];

      windowrulev2 = [
        "opacity 0.9 0.9,class:^(discord)$"
        "opacity 0.9 0.9,class:^(code-oss)$"
        "opacity 0.9 0.9,class:^(Lutris)$"
        "opacity 0.9 0.9,class:^(File-roller)$"
        "opacity 0.9 0.9,class:^(Engrampa)$"
        "opacity 0.9 0.9,class:^(Pavucontrol)$"
        "opacity 0.9 0.9,class:^(Thunar)$"
        "opacity 0.9 0.9,class:^(Dunst)$"
        "opacity 0.5 0.5,class:^(Fuzzel)$"
        "immediate, class:^(osu!)$"
      ];

      bind = [
        "SUPER, Return, exec, foot"
        "SUPER, A, killactive,"
        "SUPER, Space, togglefloating,"
        "SUPER, D, exec, rofi -show drun"
        # "SUPER, D, exec, asztal -t launcher"
        "SUPER, F, fullscreen"
        "SUPER SHIFT, E, exec, asztal -t powermenu"
        "SUPER SHIFT, H, exec, hyprpicker -anz"
        "SUPER, Tab,     exec, asztal -t overview"

        "SUPER, R, exec, asztal -r 'recorder.start()'"
        "SUPER, P, exec, asztal -r 'recorder.screenshot()'"
        "SUPER SHIFT, P, exec, asztal -r 'recorder.screenshot(true)'"

        "SUPER, N, exec, Thunar"
        "SUPER, B, exec, zen"

        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        "SUPER, 1, workspace, 1"
        "SUPER, ampersand, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, eacute, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, quotedbl, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, apostrophe, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, parenleft, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, minus, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, egrave, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, underscore, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, ccedilla, workspace, 9"
        "SUPER, 0, workspace, 10"
        "SUPER, agrave, workspace, 10"

        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, ampersand, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, eacute, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, quotedbl, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, apostrophe, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, parenleft, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, minus, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, egrave, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, underscore, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, ccedilla, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"
        "SUPER SHIFT, agrave, movetoworkspace, 10"

        # bind=,XF86MonBrightnessUp, exec, doas light -A 5 && notify-send -r 555 -a Brightness "$(printf "%.0f\n" "$(light -G)")"%
        # bind=,XF86MonBrightnessDown, exec, doas light -U 5 && notify-send -r 555 -a Brightness "$(printf "%.0f\n" "$(light -G)")"%
        # bind=,XF86AudioRaiseVolume, exec, pamixer -i 5 && notify-send -r 555 -a Volume "$(pamixer --get-volume)"%
        # bind=,XF86AudioLowerVolume, exec, pamixer -d 5 && notify-send -r 555 -a Volume "$(pamixer --get-volume)"%
        # bind=,XF86AudioMute, exec, pamixer -t && notify-send -r 555 -a Volume "$([ "$(pamixer --get-mute)" = "true" ] && (echo Muted) || (echo Unmuted) )"
        # bind=,XF86AudioNext, exec, mpc next && songnotify
        # bind=,XF86AudioPrev, exec, mpc prev && songnotify
        # bind=,XF86AudioPlay, exec, mpc toggle

        # bind = SUPER, Escape, hyprexpo:expo, toggle

        # bind = SUPER, mouse_down, workspace, e+1
        # bind = SUPER, mouse_up, workspace, e-1
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      "plugin:borders-plus-plus" = {
        add_borders = 1;

        "col.border_1" = "rgb(000000)";

        border_size_1 = 1;

        natural_rounding = true;
      };

      exec-once = [
        "hypridle"
      ];

    };
    extraConfig = ''
      # hyprexpo {
      #   columns = 3
      #     gap_size = 5
      #     bg_col = rgb(111111)
      #     workspace_method = center current # [center/first] [workspace] e.g. first 1 or center m+1
      #
      #     enable_gesture = true # laptop touchpad
      #     gesture_fingers = 3  # 3 or 4
      #     gesture_distance = 300 # how far is the "max"
      #     gesture_positive = true # positive = swipe down. Negative = swipe up.
      # }
      # hyprfocus {
      #     enabled = yes
      #     opacity = 0.7

      #     bezier = flashIn, 0.5,0.0,1.0,0.5
      #     bezier = flashOut, 0.0,0.5,0.5,1.0

      #     flash_in_bezier = flashIn
      #     flash_in_speed = 0.5

      #     flash_out_bezier = flashOut
      #     flash_out_speed = 1.2
      # }
    '';
  };
}
