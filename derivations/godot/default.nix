{ fetchurl, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
    pname = "godot";
    version = "4.1.1-stable";

    src = fetchurl {
        url = "https://github.com/godotengine/godot/releases/download/${version}/Godot_v${version}_linux.x86_64.zip";
        sha256 = "030kf4m74ajmb2val3bb0w8n0zsrpyj56gh1gj6mhy15svsx68ar";
    };

    buildInputs = [ pkgs.unzip ];

    unpackPhase = "unzip $src";

    installPhase = ''
        echo ${version}
        install -Dm 755 Godot_v4.1.1-stable_linux.x86_64    $out/bin/godot
    '';
}
