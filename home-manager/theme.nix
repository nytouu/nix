{
  config,
  pkgs,
  lib,
  ...
}:

{
  options =
    with lib;
    with types;
    {
      darkmode = mkOption { type = bool; };
    };
  config = {
    darkmode = true;

    home.packages = with pkgs; [
      glib
      gsettings-desktop-schemas
      graphite-kde-theme
      adwsteamgtk
    ];

    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = if config.darkmode then "prefer-dark" else "prefer-light";
        };
      };
    };

    home = {
      pointerCursor = {
        package = pkgs.callPackage ../derivations/notwaita-cursor/default.nix { };
        name = "Notwaita-Black";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "qt5ct";
      style.name = "kvantum";
    };

    gtk = {
      enable = true;
      font.name = "Torus Pro";
      cursorTheme = {
        name = "Notwaita-Black";
        package = pkgs.callPackage ../derivations/notwaita-cursor/default.nix { };
      };
      theme = {
        name = if config.darkmode then "adw-gtk3-dark" else "adw-gtk3";
        package = pkgs.adw-gtk3;
      };
      iconTheme = {
        name = if config.darkmode then "Papirus-Dark" else "Papirus-Light";
        package = pkgs.papirus-icon-theme.override {
          color = "adwaita";
        };
      };
      gtk2 = {
        extraConfig = ''
          gtk-decoration-layout = appmenu:,menu:
          gtk-enable-event-sounds = 0
          gtk-enable-input-feedback-sounds = 0
        '';
      };
      gtk3 = {
        extraConfig = {
          gtk-decoration-layout = "appmenu:,menu:";
          gtk-enable-event-sounds = 0;
          gtk-enable-input-feedback-sounds = 0;
          gtk-button-images = 1;
          gtk-menu-images = 1;
          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintfull";
          gtk-xft-rgba = "rgb";
        };
        extraCss = builtins.readFile ./config/gtk.css;
      };
      gtk4 = {
        extraConfig = {
          gtk-decoration-layout = "appmenu:,menu:";
          gtk-enable-event-sounds = 0;
          gtk-enable-input-feedback-sounds = 0;
          gtk-button-images = 1;
          gtk-menu-images = 1;
          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintfull";
          gtk-xft-rgba = "rgb";
        };
        extraCss = builtins.readFile ./config/gtk.css;
      };
    };

    xresources.properties = {
      "*.font" = "Torus Pro";
      "Xft.dpi" = 96;
      "XTerm*renderFont" = true;
      "XTerm*faceName" = "xft: MartianMono Nerd Font";
      "XTerm*faceSize" = 13;
      "Xft.hinting" = true;
      "Xft.hintstyle" = "hintfull";

      "Xcursor.theme" = "Notwaita-Black";
      "Xcursor.size" = 24;

      "*background" = if config.darkmode then "#1D1D1D" else "#FCFCFC";
      "*foreground" = if config.darkmode then "#FFFFFF" else "#3d3846";
      "*color0" = "#262626";
      "*color8" = "#393939";
      "*color1" = "#F66151";
      "*color9" = "#F66151";
      "*color2" = "#57E389";
      "*color10" = "#57E389";
      "*color3" = "#F9F06B";
      "*color11" = "#F9F06B";
      "*color4" = "#62A0EA";
      "*color12" = "#62A0EA";
      "*color5" = "#DC8ADD";
      "*color13" = "#DC8ADD";
      "*color6" = "#93DDC2";
      "*color14" = "#93DDC2";
      "*color7" = "#525252";
      "*color15" = "#525252";

      "st.background" = if config.darkmode then "#1D1D1D" else "#FCFCFC";
      "st.foreground" = if config.darkmode then "#FFFFFF" else "#3d3846";
      "st.color0" = if config.darkmode then "#262626" else "#ECEFF1";
      "st.color8" = "#393939";
      "st.color1" = "#F66151";
      "st.color9" = "#F66151";
      "st.color2" = "#57E389";
      "st.color10" = "#57E389";
      "st.color3" = "#F9F06B";
      "st.color11" = "#F9F06B";
      "st.color4" = "#62A0EA";
      "st.color12" = "#62A0EA";
      "st.color5" = "#DC8ADD";
      "st.color13" = "#DC8ADD";
      "st.color6" = "#93DDC2";
      "st.color14" = "#93DDC2";
      "st.color7" = "#525252";
      "st.color15" = "#525252";

      "st.font" = "MartianMono Nerd Font:style=Medium:size=10:autohint=true";
      "st.alpha" = "0.95";
    };

    programs.kitty = {
      settings = {
        background = if config.darkmode then "#1D1D1D" else "#FCFCFC";
        foreground = if config.darkmode then "#FFFFFF" else "#3d3846";
        color0 = if config.darkmode then "#262626" else "#ECEFF1";
        color8 = "#393939";
        color1 = "#F66151";
        color9 = "#F66151";
        color2 = "#57E389";
        color10 = "#57E389";
        color3 = "#F9F06B";
        color11 = "#F9F06B";
        color4 = "#62A0EA";
        color12 = "#62A0EA";
        color5 = "#DC8ADD";
        color13 = "#DC8ADD";
        color6 = "#93DDC2";
        color14 = "#93DDC2";
        color7 = "#525252";
        color15 = "#525252";
      };
    };

    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text =
        if config.darkmode then
          ''
            [General]
            theme=GraphiteDark
          ''
        else
          ''
            [General]
            theme=Graphite
          '';

      "Kvantum/Graphite".source = "${pkgs.graphite-kde-theme}/share/Kvantum/Graphite";
    };
  };

}
