{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];
	# programs.firefox = {
	# 	enable = true;
	# 	package = pkgs.firefox.override {
	# 		# See nixpkgs' firefox/wrapper.nix to check which options you can use
	# 		cfg = {
	# 			# Gnome shell native connector
	# 			enableGnomeExtensions = true;
	# 		};
	# 	};
	# };
}
