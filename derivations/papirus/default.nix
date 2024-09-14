{ fetchurl, pkgs ? import <nixpkgs> {} }:
let 
	neorg-img = pkgs.fetchurl {
		url = "https://github.com/nvim-neorg/neorg/blob/main/res/neorg.svg";
		sha256 = "sha256-V+/SMoWH7dA89NoQ5YAZ5SN4Yk0ARN379E9fQCEmN4s=";
	};
in
pkgs.stdenv.mkDerivation rec {
  pname = "papirus-icon-theme";
  version = "20230301";

  src = fetchurl {
  	url = "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/refs/tags/${version}.zip";
    sha256 = "sha256-cEEjCm/C6+8ClfjiJjguGaZMYT7OM/v5aAiPHaulJPE=";
  };

  buildInputs = [ pkgs.unzip ];

  # unpackPhase = "unzip $src";
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/icons
	${pkgs.unzip} $src -d $out

	mv -r $src/papirus-icon-theme-${version}/Papirus-Dark $out/share/icons

	# cp -r ${neorg-img} $out/share/icons/Papirus-Dark/24x24/apps/
  '';
}
