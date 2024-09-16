{ pkgs, ... }:
let
  gtkCssContent = ''
    menu,
    .menu,
    .context-menu {
      margin: 4px;
      padding: 4px 4px;
      background-clip: border-box;
      border-radius: 0px;
      border: 1px solid rgba(0, 0, 0, 0.08);
    }

    .csd menu,
    .csd .menu,
    .csd .context-menu {
      border: none;
      border-radius: 12px;
    }

    menu menuitem,
    .menu menuitem,
    .context-menu
    menuitem {
      margin: 0;
      border-radius: 6px;
      padding: 5px 5px;
    }

    window {
        border: none;
        border-radius: 0px;
    }

    decoration {
        border: none;
        border-radius: 0px;
    }

    .titlebar {
        border: none;
        border-radius: 0;
    }

    .header-bar {
        background-image: none;
        box-shadow: none;
        border: none;
        border-radius: 0;
    }

    GtkLabel.title {
        opacity: 0;
    }

    menu separator { margin: 4px; }

    .csd.popup decoration {
      border-radius: 12px;
      box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
    }
    	'';
in
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
      name = "adwaita";
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
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Light";
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
      extraCss = gtkCssContent;
    };
    gtk4 = {
      extraConfig = {
        gtk-decoration-layout = "appmenu:,menu:";
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
      };
      extraCss = gtkCssContent;
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

    "*background" = "#fcfcfc";
    "*foreground" = "#3d3846";
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
    "st.background" = "#fcfcfc";
    "st.foreground" = "#3d3846";
    "st.color0" = "#262626";
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
  };
}
