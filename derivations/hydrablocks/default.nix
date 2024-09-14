{ fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    name = "hydrablocks";
	src = fetchFromGitHub {
		owner = "nytouu";
		repo = "hydrablocks";
		rev = "4a43d12dba73d03e94fc67dc2e38338ae5160650";
		sha256 = "1dyv8vah6ppgz6hv46rmg5a7f8iwa58gpgjss8s7w8zn48ajk9bj";
	};

	buildInputs = with pkgs; [ xorg.libX11 ];

    installPhase = ''
		runHook preInstall

		mkdir -p $out/bin
        install -Dm 755 hydrablocks $out/bin/hydrablocks

		runHook postInstall
    '';
}
