{ pkgs, ... }:
{
  home.packages = with pkgs; [
    adw-gtk3
    papirus-icon-theme

    (callPackage ../../derivations/notwaita-cursor/default.nix { })
  ];

  home = {
    pointerCursor = {
      package = pkgs.callPackage ../../derivations/notwaita-cursor/default.nix { };
      name = "Notwaita-Black";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  gtk = {
    enable = true;
    font.name = "Torus Pro";
    cursorTheme = {
      name = "Notwaita-Black";
      package = pkgs.callPackage ../../derivations/notwaita-cursor/default.nix { };
    };
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
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
      };
      extraCss = builtins.readFile ../config/gtk.css;
    };
    gtk4 = {
      extraConfig = {
        gtk-decoration-layout = "appmenu:,menu:";
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
      };
      extraCss = builtins.readFile ../config/gtk.css;
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

    "*background" = "#1D1D1D";
    "*foreground" = "#FFFFFF";
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

    "st.font" = "MartianMono Nerd Font:style=Medium:size=10:autohint=true";
    "st.alpha" = "0.95";
  };
}
