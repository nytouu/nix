{ pkgs, ... }:
{
	home.packages = with pkgs; [
		adw-gtk3
		papirus-icon-theme

    # simp1e-cursors
		(callPackage ../derivations/notwaita-cursor/default.nix { })

    glib

    # kdePackages.qtstyleplugin-kvantum
    lightly-qt
    qt5ct
    # adwaita-qt
	];

/*
	home = {
		pointerCursor = {
      package = pkgs.callPackage ../derivations/notwaita-cursor/default.nix { };
			name = "Notwaita-Black";
			size = 24;
			gtk.enable = true;
			x11.enable = true;
		};

		# file.".config/gtk-4.0/gtk.css".source = ./config/gtk.css;
		# file.".config/gtk-3.0/gtk.css".source = ./config/gtk.css;
	};
 */

	qt = {
		enable = true;
		platformTheme.name = "qt5ct";
		style = {
			name = "Lightly";
			package = pkgs.lightly-qt;
		};
	};

	/*
	gtk = {
		enable = true;
		font.name = "Torus Pro";
		cursorTheme = {
			name = "Notwaita-Black";
      package = pkgs.callPackage ../derivations/notwaita-cursor/default.nix { };
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
		};
		gtk4 = {
			extraConfig = {
				gtk-decoration-layout = "appmenu:,menu:";
				gtk-enable-event-sounds = 0;
				gtk-enable-input-feedback-sounds = 0;
			};
		};
	};
	*/
}
