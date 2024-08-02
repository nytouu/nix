{ pkgs, ... }:

{
    home = {
        file = {
            ".config/htop".source = ./config/htop;
            ".config/lazygit".source = ./config/lazygit;
            ".config/neofetch".source = ./config/neofetch;
            ".config/slippy-xd.conf".source = ./config/skippy-xd/skippy-xd.rc;
            ".config/compfy.conf".source = ./config/compfy.conf;
            ".config/picom.conf".source = ./config/picom.conf;
            ".config/rofi".source = ./config/rofi;
            ".config/fontconfig".source = ./config/fontconfig;

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
