{ fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    name = "gruvbox-material-gtk";
	src = fetchFromGitHub {
		owner = "TheGreatMcPain";
		repo = "gruvbox-material-gtk";
		rev = "a1295d8bcd4dfbd0cd6793d7b1583b442438ed89";
		sha256 = "1lcpx564kbkv9gamlsv5wczsgh70n1v5sdcm34x55b0rbvq8xsan";
        fetchSubmodules = true;
	};

	installPhase = ''
	     mkdir -p $out/share/icons
	     mkdir -p $out/share/themes
		 mv $src/themes -d $out/share/themes
		 mv $src/icons -d $out/share/icons
	'';
}
