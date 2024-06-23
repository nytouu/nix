{ fetchurl, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
    name = "notwaita-cursor";
    version = "v1.0.0-alpha1";

    src = fetchurl {
        url = "https://github.com/ful1e5/notwaita-cursor/releases/download/${version}/Notwaita.tar.xz";
        sha256 = "1wkcsh1182krmpsq4vaw15cc85dfcyzvvkzgc7h63ap2cjf8v4lk";
    };

    buildInputs = [ pkgs.tar ];

    unpackPhase = "tar -xvf Notwaita.tar.gz";

    installPhase = ''
        mv Notwaita-* $out/share/icons/
    '';
}
