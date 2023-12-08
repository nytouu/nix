{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
	name = "oxocarbon";

	src = pkgs.fetchFromGitHub {
		owner = "tsukki9696";
		repo = "tsukihime";
		rev = "a034c5fad0761e1b3f89c4561c70e84d38822011";
		sha256 = "1da9b6mk36q91mpwc5xd1kxc1hwvahsbbghna3pxjjf08vhsk025";
	};

	installPhase = ''
		mkdir -p $out/share/themes
		mv gtk-themes/oomox-base16-oxocarbon-dark $out/share/themes/oxocarbon
	'';
}
