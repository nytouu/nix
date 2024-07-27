{inputs, config, pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    extraConfig = ''
monitor=,preferred,auto,1

input {
    kb_layout = fr
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =
    numlock_by_default = yes
    accel_profile = flat

    follow_mouse = 1

    touchpad {
        natural_scroll = yes
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    gaps_in = 12
    gaps_out = 24
    border_size = 1
    col.active_border = rgba(666666ee)
    col.inactive_border = rgba(333333ee)

    layout = master
    allow_tearing = true
}

 decoration {
     inactive_opacity = 1.00
     rounding = 12
 
#     blur = true
#     blur_size = 10
#     blur_passes = 1
#     blur_size = 6
#     blur_passes = 4
#     blur_new_optimizations = true
#     blur_ignore_opacity = false

     # shadow_range = 12
     # shadow_render_power = 0.5 
     drop_shadow = yes
     shadow_range = 30
     shadow_render_power = 3 
     col.shadow = rgba(0000003e)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    # bezier = myBezier, 0.05, 0.9, 0.1, 1.0

    # animation = windows, 1, 7, myBezier
    # animation = windowsOut, 1, 7, default, popin 80%
    # animation = border, 1, 10, default
    # animation = fade, 1, 7, default
    # animation = workspaces, 1, 6, default

    bezier = md3_standard, 0.2, 0.0, 0, 1.0
    bezier = md3_decel, 0.05, 0.7, 0.1, 1
    bezier = md3_accel, 0.3, 0, 0.8, 0.15
    bezier = overshot, 0.05, 0.9, 0.1, 1.05
    bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
    bezier = win10, 0, 0, 0, 1
    bezier = gnome, 0, 0.85, 0.3, 1
    bezier = funky, 0.46, 0.35, -0.2, 1.2
    # Animation configs
    animation = windows, 1, 2, overshot, popin 80%
    animation = windowsOut, 1, 2, overshot, popin 80%
    animation = border, 1, 10, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 4, md3_decel, slide
}

dwindle {
    pseudotile = no # master switch for pseudotiling. Enabling is bound to SUPER + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    new_status = master
    no_gaps_when_only = false
    new_on_top = true
    mfact = 0.50
}

gestures {
    workspace_swipe = on
    workspace_swipe_distance = 500
    workspace_swipe_create_new = yes
}

misc {
    disable_hyprland_logo = no
    vfr = yes
    vrr = no
    enable_swallow = yes
    mouse_move_enables_dpms = yes
    focus_on_activate = yes
    # animate_manual_resizes = true
    # animate_mouse_windowdragging = true
}

plugin {
    borders-plus-plus {
        add_borders = 1 # 0 - 2
        col.border_1 = rgb(000000) # example col for border 1
        # col.border_2 = rgb(000000) # example col for border 2
    }
    hyprexpo {
      columns = 3
        gap_size = 5
        bg_col = rgb(111111)
        workspace_method = center current # [center/first] [workspace] e.g. first 1 or center m+1

        enable_gesture = true # laptop touchpad
        gesture_fingers = 3  # 3 or 4
        gesture_distance = 300 # how far is the "max"
        gesture_positive = true # positive = swipe down. Negative = swipe up.
    }
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
}

windowrule = float, ^(Connman-gtk)$
windowrule = float, ^(Blueberry.py)$
windowrule = float, ^(Galculator)$
windowrule = float, ^(Engrampa)$
windowrule = float, ^(File-roller)$
windowrule = float, ^(pulsemixer)$
windowrule = float, ^(calcurse)$
windowrule = float, ^(ncmpcpp)$
windowrule = workspace 1, ^(steam)$
windowrule = workspace 4, ^(firefox)$
windowrule = workspace 4, ^(librewolf)$
windowrule = workspace 6, ^(discord)$
windowrule = workspace 5, ^(osu!.exe)$
windowrule = workspace 5, ^(osu!)$
windowrule = pin, title:^(Picture-in-Picture)$

windowrulev2 = opacity 0.9 0.9,class:^(discord)$
windowrulev2 = opacity 0.9 0.9,class:^(code-oss)$
windowrulev2 = opacity 0.9 0.9,class:^(Lutris)$
windowrulev2 = opacity 0.9 0.9,class:^(File-roller)$
windowrulev2 = opacity 0.9 0.9,class:^(Engrampa)$
windowrulev2 = opacity 0.9 0.9,class:^(Pavucontrol)$
windowrulev2 = opacity 0.9 0.9,class:^(Thunar)$
windowrulev2 = opacity 0.9 0.9,class:^(Dunst)$
windowrulev2 = opacity 0.5 0.5,class:^(Fuzzel)$
windowrulev2 = immediate, class:^(osu!)$


bind = SUPER, Return, exec, foot
bind = SUPER, A, killactive,
bind = SUPER, Space, togglefloating,
bind = SUPER, D, exec, asztal -t launcher
bind = SUPER, F, fullscreen
# bind = SUPER, P, pseudo, # dwindle
# bind = SUPER, X, togglesplit, # dwindle
bind = SUPER SHIFT, E, exec, asztal -t powermenu
# bind = SUPER SHIFT, U, exec, [ pgrep wayabr ] && killall waybar || waybar
bind = SUPER SHIFT, H, exec, hyprpicker -anz
bind = SUPER, Tab,     exec, asztal -t overview

bind = SUPER, R, exec, asztal -r 'recorder.start()'
bind = SUPER, P, exec, asztal -r 'recorder.screenshot()'
bind = SUPER SHIFT, P, exec, asztal -r 'recorder.screenshot(true)'

# bind = CTRL ALT, L, exec, mpc next
# bind = CTRL ALT, H, exec, mpc prev
# bind = CTRL ALT, J, exec, mpc volume -5
# bind = CTRL ALT, K, exec, mpc volume +5
# bind = CTRL ALT, Space, exec, mpc toggle

# bind=,XF86MonBrightnessUp, exec, doas light -A 5 && notify-send -r 555 -a Brightness "$(printf "%.0f\n" "$(light -G)")"%
# bind=,XF86MonBrightnessDown, exec, doas light -U 5 && notify-send -r 555 -a Brightness "$(printf "%.0f\n" "$(light -G)")"%
# bind=,XF86AudioRaiseVolume, exec, pamixer -i 5 && notify-send -r 555 -a Volume "$(pamixer --get-volume)"%
# bind=,XF86AudioLowerVolume, exec, pamixer -d 5 && notify-send -r 555 -a Volume "$(pamixer --get-volume)"%
# bind=,XF86AudioMute, exec, pamixer -t && notify-send -r 555 -a Volume "$([ "$(pamixer --get-mute)" = "true" ] && (echo Muted) || (echo Unmuted) )"
# bind=,XF86AudioNext, exec, mpc next && songnotify
# bind=,XF86AudioPrev, exec, mpc prev && songnotify
# bind=,XF86AudioPlay, exec, mpc toggle

bind = SUPER, Escape, hyprexpo:expo, toggle

bind = SUPER, N, exec, Thunar
bind = SUPER, B, exec, firefox

bind = SUPER, H, movefocus, l
bind = SUPER, L, movefocus, r
bind = SUPER, K, movefocus, u
bind = SUPER, J, movefocus, d

bind = SUPER, 1, workspace, 1
bind = SUPER, ampersand, workspace, 1
bind = SUPER, 2, workspace, 2
bind = SUPER, eacute, workspace, 2
bind = SUPER, 3, workspace, 3
bind = SUPER, quotedbl, workspace, 3
bind = SUPER, 4, workspace, 4
bind = SUPER, apostrophe, workspace, 4
bind = SUPER, 5, workspace, 5
bind = SUPER, parenleft, workspace, 5
bind = SUPER, 6, workspace, 6
bind = SUPER, minus, workspace, 6
bind = SUPER, 7, workspace, 7
bind = SUPER, egrave, workspace, 7
bind = SUPER, 8, workspace, 8
bind = SUPER, underscore, workspace, 8
bind = SUPER, 9, workspace, 9
bind = SUPER, ccedilla, workspace, 9
bind = SUPER, 0, workspace, 10
bind = SUPER, agrave, workspace, 10

bind = SUPER SHIFT, 1, movetoworkspace, 1
bind = SUPER SHIFT, ampersand, movetoworkspace, 1
bind = SUPER SHIFT, 2, movetoworkspace, 2
bind = SUPER SHIFT, eacute, movetoworkspace, 2
bind = SUPER SHIFT, 3, movetoworkspace, 3
bind = SUPER SHIFT, quotedbl, movetoworkspace, 3
bind = SUPER SHIFT, 4, movetoworkspace, 4
bind = SUPER SHIFT, apostrophe, movetoworkspace, 4
bind = SUPER SHIFT, 5, movetoworkspace, 5
bind = SUPER SHIFT, parenleft, movetoworkspace, 5
bind = SUPER SHIFT, 6, movetoworkspace, 6
bind = SUPER SHIFT, minus, movetoworkspace, 6
bind = SUPER SHIFT, 7, movetoworkspace, 7
bind = SUPER SHIFT, egrave, movetoworkspace, 7
bind = SUPER SHIFT, 8, movetoworkspace, 8
bind = SUPER SHIFT, underscore, movetoworkspace, 8
bind = SUPER SHIFT, 9, movetoworkspace, 9
bind = SUPER SHIFT, ccedilla, movetoworkspace, 9
bind = SUPER SHIFT, 0, movetoworkspace, 10
bind = SUPER SHIFT, agrave, movetoworkspace, 10

# bind = SUPER, mouse_down, workspace, e+1
# bind = SUPER, mouse_up, workspace, e-1

bindm = SUPER, mouse:272, movewindow
bindm = SUPER, mouse:273, resizewindow

exec-once = hypridle
exec-once = ~/.config/hypr/autostart.sh

  '';
  plugins = [
			inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.borders-plus-plus
			inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
			# inputs.hyprspace.packages.${pkgs.stdenv.hostPlatform.system}.Hyprspace
    ];
  };

  home.packages = with pkgs; [
    foot
    hyprpaper
	  wl-clipboard
	  wf-recorder
	  hyprpicker
		wayshot
		swappy
		hypridle
		hyprlock
  ];
}
