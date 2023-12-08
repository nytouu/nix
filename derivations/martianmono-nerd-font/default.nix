{ fetchurl, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
    name = "martianmono-nerd-font";
    version = "v3.1.0";

    src = fetchurl {
        url = "https://github.com/ryanoasis/nerd-fonts/releases/download/${version}/MartianMono.zip";
        sha256 = "016kclsb7yv30ba306z3c9qlgv2gkswf7vakdh22zvbb8kqpqv3k";
    };

    buildInputs = [ pkgs.unzip ];

    unpackPhase = "unzip $src";

    installPhase = ''
        install -Dm 444 *.ttf 	$out/share/fonts/martianmono-nerd-font
    '';
	# install -Dm 444 MartianMonoNerdFont-Medium.ttf 	$out/share/fonts/martianmono-nerd-font
}
