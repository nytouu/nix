{ fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    name = "hydrablocks";
	src = fetchFromGitHub {
		owner = "nytouu";
		repo = "hydrablocks";
		rev = "c142970648de327de7224508e360e60557746adb";
		sha256 = "1f3x1g6fiqdipkrcbnwi640nd2sgy8hqla8cflby61wljhzp6xs0";
	};

	buildInputs = with pkgs; [ xorg.libX11 ];

    installPhase = ''
		runHook preInstall

		mkdir -p $out/bin
        install -Dm 755 hydrablocks $out/bin/hydrablocks

		runHook postInstall
    '';
}
