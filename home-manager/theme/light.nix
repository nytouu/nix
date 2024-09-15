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

    (callPackage ../derivations/notwaita-cursor/default.nix { })
  ];

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
      package = pkgs.callPackage ../derivations/notwaita-cursor/default.nix { };
    };
    theme = {
      name = "adw-gtk3";
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
}
