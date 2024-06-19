{ pkgs, ... }:
{
	home.packages = with pkgs; [
		adw-gtk3
		papirus-icon-theme
		simp1e-cursors
		lightly-qt
		adwaita-qt
	];

	home = {
		pointerCursor = {
			package = pkgs.simp1e-cursors;
			name = "Simp1e-Adw-Dark";
			size = 24;
			gtk.enable = true;
			x11.enable = true;
		};

	# file.".config/gtk-4.0/gtk.css".source = ./config/gtk-4.0/gtk.css;
	# file.".config/gtk-3.0/gtk.css".source = ./config/gtk-3.0/gtk.css;

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
    font.name = "SF Pro Display";
		cursorTheme = {
			name = "Simp1e-Adw-Dark";
			package = pkgs.bibata-cursors;
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
			bookmarks = [
				"file:///mnt/KINGSTON"
				"file:///home/nytou/docs"
				"file:///home/nytou/music"
				"file:///home/nytou/pics"
				"file:///home/nytou/vids"
				"file:///home/nytou/downloads"
				"file:///home/nytou/nix"
				"file:///home/nytou/git"
				"file:///home/nytou/code"
				"file:///mnt/KINGSTON/Cours"
			];
		};
		gtk4 = {
      extraConfig = {
        gtk-decoration-layout = "appmenu:,menu:";
        gtk-enable-event-sounds = 0;
        gtk-enable-input-feedback-sounds = 0;
      };
    };
	};
}
