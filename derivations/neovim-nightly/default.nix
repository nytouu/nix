{ fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    name = "neovim-nightly";
	src = fetchFromGitHub {
		owner = "neovim";
		repo = "neovim";
		rev = "be83cd73b274ef9d81ff45f5f833ee8ac2ffc01e";
		sha256 = "1fld8v8mm6nbfc0s9hy1y9g6kfrz04r22m2wq00hyc5yy1bvcqp4";
	};

    cmakeBuildType="RelWithDebInfo";

	# buildInputs = with pkgs; [ xorg.libX11 ];
}
