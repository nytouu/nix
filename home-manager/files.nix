{ pkgs, ... }:

{
    home = {
        file = {
            ".config/htop/htoprc".source = ./config/htop/htoprc;
            ".config/lazygit/config.yml".source = ./config/lazygit/config.yml;
            ".mozilla/firefox/734y6nh3.default/chrome/userChrome.css".source = ./config/librewolf/userChrome.css;
            ".config/neofetch/config.conf".source = ./config/neofetch/config.conf;
            ".config/slippy-xd/skippy-xd.rc".source = ./config/skippy-xd/skippy-xd.rc;
            ".config/picom.conf".source = ./config/picom.conf;
            ".config/rofi".source = ./config/rofi;

            # ".config/awesome/rc.lua".source = ./config/awesome/rc.lua;
            # ".config/awesome/theme.lua".source = ./config/awesome/theme.lua;

            # ".config/hypr/hyprland.conf".source = ./config/hypr/hyprland.conf;
            # ".config/hypr/hyprpaper.conf".source = ./config/hypr/hyprpaper.conf;
            # ".config/hypr/env_var.conf".source = ./config/hypr/env_var.conf;
            # ".config/hypr/autostart.sh".source = ./config/hypr/autostart.sh;
            # ".config/waybar/colors.css".source = ./config/waybar/colors.css;
            # ".config/waybar/config".source = ./config/waybar/config;
            # ".config/waybar/style.css".source = ./config/waybar/style.css;
        };
    };
}
