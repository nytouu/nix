{ pkgs, inputs, ... }:
let 
		pkgs-unstable = import inputs.unstable { system = "x86_64-linux"; config.allowUnfree = true; };
in
{
  home.packages = with pkgs; [
    # firefox
    pkgs-unstable.librewolf
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
