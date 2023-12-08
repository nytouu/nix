{ fetchurl, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
    name = "nerd-symbols";
    version = "v3.0.2";

    src = fetchurl {
        url = "https://github.com/ryanoasis/nerd-fonts/releases/download/${version}/NerdFontsSymbolsOnly.zip";
        sha256 = "1szz35mms27yllgk41pxxzkdkwbng47znsbpd52rirp0xxd3ansm";
    };

    buildInputs = [ pkgs.unzip ];

    unpackPhase = "unzip $src";

    installPhase = ''
        install -Dm 444 SymbolsNerdFont-Regular.ttf 		$out/share/fonts/nerd-symbols
        install -Dm 444 SymbolsNerdFontMono-Regular.ttf 	$out/share/fonts/nerd-symbols
    '';
}
