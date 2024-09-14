{ fetchurl, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    name = "torus-pro";
    src = fetchurl {
        url = "https://ifonts.xyz/wp-content/uploads/2021/07/toruspro.rar";
        sha256 = "0dyf36c0dy72cadx7p1y8ksrhvzd3yd59nblan57q4acpp0lk6a8";
    };

    buildInputs = [ pkgs.unrar ];

    unpackPhase = "unrar x $src";

    installPhase = ''
        cd ./Torus.Pro
        install -Dm 444 ./TorusPro-BoldItalic.ttf $out/share/fonts/torus-pro/TorusPro-BoldItalic.ttf
        install -Dm 444 ./TorusPro-HeavyItalic.ttf $out/share/fonts/torus-pro/TorusPro-HeavyItalic.ttf
        install -Dm 444 ./TorusPro-Italic.ttf $out/share/fonts/torus-pro/TorusPro-Italic.ttf
        install -Dm 444 ./TorusPro-Light.ttf $out/share/fonts/torus-pro/TorusPro-Light.ttf
        install -Dm 444 ./TorusPro-LightItalic.ttf $out/share/fonts/torus-pro/TorusPro-LightItalic.ttf
        install -Dm 444 ./TorusPro-Regular.ttf $out/share/fonts/torus-pro/TorusPro-Regular.ttf
        install -Dm 444 ./TorusPro-SemiBold.ttf $out/share/fonts/torus-pro/TorusPro-SemiBold.ttf
        install -Dm 444 ./TorusPro-SemiBoldItalic.ttf $out/share/fonts/torus-pro/TorusPro-SemiBoldItalic.ttf
        install -Dm 444 ./TorusPro-Thin.ttf $out/share/fonts/torus-pro/TorusPro-Thin.ttf
        install -Dm 444 ./TorusPro-ThinItalic.ttf $out/share/fonts/torus-pro/TorusPro-ThinItalic.ttf
    '';

}
