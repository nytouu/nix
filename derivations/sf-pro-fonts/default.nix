{ pkgs ? import <nixpkgs> {} }:

# let
#   imgLink = "https://something";
# 
#   image = pkgs.fetchurl {
# 	url = imgLink;
# 	sha256 = "sha256-lkjsdflkjdsf";
#   };
# in

pkgs.stdenv.mkDerivation {
  name = "sf-pro-fonts";
  src = pkgs.fetchFromGitHub {
    owner = "sahibjotsaggu";
	repo = "San-Francisco-Pro-Fonts";
	rev = "8bfea09aa6f1139479f80358b2e1e5c6dc991a58";
	sha256 = "0zm9112y5x6z36mhcqlga4lmiqjhp1n7qiszmd3h3wi77z3c81cq";
  };
  installPhase = ''
    install -Dm 444 ./SF-Pro-Display-BoldItalic.ttf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-BoldItalic.ttf
    install -Dm 444 ./SF-Pro-Display-Black.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Black.otf
    install -Dm 444 ./SF-Pro-Display-BlackItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-BlackItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-BlackItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-BlackItalic.otf
    install -Dm 444 ./SF-Pro-Display-Bold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Bold.otf
    install -Dm 444 ./SF-Pro-Display-BoldItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-BoldItalic.otf
    install -Dm 444 ./SF-Pro-Display-Heavy.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Heavy.otf
    install -Dm 444 ./SF-Pro-Display-HeavyItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-HeavyItalic.otf
    install -Dm 444 ./SF-Pro-Display-Light.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Light.otf
    install -Dm 444 ./SF-Pro-Display-LightItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-LightItalic.otf
    install -Dm 444 ./SF-Pro-Display-Medium.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Medium.otf
    install -Dm 444 ./SF-Pro-Display-MediumItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-MediumItalic.otf
    install -Dm 444 ./SF-Pro-Display-Regular.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Regular.otf
    install -Dm 444 ./SF-Pro-Display-RegularItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-RegularItalic.otf
    install -Dm 444 ./SF-Pro-Display-Semibold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Semibold.otf
    install -Dm 444 ./SF-Pro-Display-SemiboldItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-SemiboldItalic.otf
    install -Dm 444 ./SF-Pro-Display-Thin.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Thin.otf
    install -Dm 444 ./SF-Pro-Display-ThinItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-ThinItalic.otf
    install -Dm 444 ./SF-Pro-Display-Ultralight.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Ultralight.otf
    install -Dm 444 ./SF-Pro-Display-UltralightItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-UltralightItalic.otf
    install -Dm 444 ./SF-Pro-Italic.ttf $out/share/fonts/sf-pro-fonts/SF-Pro-Italic.ttf
    install -Dm 444 ./SF-Pro-Rounded-Black.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Black.otf
    install -Dm 444 ./SF-Pro-Rounded-Bold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Bold.otf
    install -Dm 444 ./SF-Pro-Rounded-Heavy.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Heavy.otf
    install -Dm 444 ./SF-Pro-Rounded-Light.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Light.otf
    install -Dm 444 ./SF-Pro-Rounded-Medium.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Medium.otf
    install -Dm 444 ./SF-Pro-Rounded-Regular.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Regular.otf
    install -Dm 444 ./SF-Pro-Rounded-Semibold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Semibold.otf
    install -Dm 444 ./SF-Pro-Rounded-Thin.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Thin.otf
    install -Dm 444 ./SF-Pro-Rounded-Ultralight.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Ultralight.otf
    install -Dm 444 ./SF-Pro-Text-Black.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Black.otf
    install -Dm 444 ./SF-Pro-Text-BlackItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-BlackItalic.otf
    install -Dm 444 ./SF-Pro-Text-Bold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Bold.otf
    install -Dm 444 ./SF-Pro-Text-BoldItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-BoldItalic.otf
    install -Dm 444 ./SF-Pro-Text-Heavy.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Heavy.otf
    install -Dm 444 ./SF-Pro-Text-HeavyItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-HeavyItalic.otf
    install -Dm 444 ./SF-Pro-Text-Light.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Light.otf
    install -Dm 444 ./SF-Pro-Text-LightItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-LightItalic.otf
    install -Dm 444 ./SF-Pro-Text-Medium.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Medium.otf
    install -Dm 444 ./SF-Pro-Text-MediumItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-MediumItalic.otf
    install -Dm 444 ./SF-Pro-Text-Regular.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Regular.otf
    install -Dm 444 ./SF-Pro-Text-RegularItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-RegularItalic.otf
    install -Dm 444 ./SF-Pro-Text-Semibold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Semibold.otf
    install -Dm 444 ./SF-Pro-Text-SemiboldItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-SemiboldItalic.otf
    install -Dm 444 ./SF-Pro-Text-Thin.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Thin.otf
    install -Dm 444 ./SF-Pro-Text-ThinItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-ThinItalic.otf
    install -Dm 444 ./SF-Pro-Text-Ultralight.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Ultralight.otf
    install -Dm 444 ./SF-Pro-Text-UltralightItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-UltralightItalic.otf
    install -Dm 444 ./SF-Pro.ttf $out/share/fonts/sf-pro-fonts/SF-Pro.ttf
	  '';
}
