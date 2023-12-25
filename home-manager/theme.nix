{ pkgs, ... }:
# let 
{ 
	home.packages = with pkgs; [
		colloid-gtk-theme
		adw-gtk3
		papirus-icon-theme
		bibata-cursors
		lightly-qt
		adwaita-qt
	];

	home = {
		pointerCursor = {
			package = pkgs.bibata-cursors;
			name = "Bibata-Original-Ice";
			size = 24;
			gtk.enable = true;
			x11.enable = true;
		};

		file.".config/gtk-4.0/gtk.css".source = ./config/gtk.css;
		file.".config/gtk-3.0/gtk.css".source = ./config/gtk.css;

	};
	qt = {
		enable = true;
		platformTheme = "gtk3";
		style = {
			name = "adwaita-dark";
			package = pkgs.adwaita-qt;
		};
	};
	gtk = {
		enable = true;
		font.name = "Torus Pro";
		cursorTheme = {
			name = "Bibata-Original-Ice";
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
        gtk-decoration-layout = appmenu:none,menu:none
      '';
    };
		gtk3 = {
      extraConfig = {
        gtk-decoration-layout = "appmenu:none,menu:none";
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
        gtk-decoration-layout = "appmenu:none,menu:none";
      };
    };
	};
}
