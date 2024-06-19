{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "sf-pro-fonts";
  src = pkgs.fetchFromGitHub {
    owner = "sahibjotsaggu";
    repo = "San-Francisco-Pro-Fonts";
    rev = "8bfea09aa6f1139479f80358b2e1e5c6dc991a58";
    sha256 = "0zm9112y5x6z36mhcqlga4lmiqjhp1n7qiszmd3h3wi77z3c81cq";
  };
  installPhase = ''
    mkdir -p $out/share/fonts/sf-pro-fonts
    mv ./SF-Pro-Display-Black.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Black.otf
    mv ./SF-Pro-Display-BlackItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-BlackItalic.otf
    mv ./SF-Pro-Display-Bold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Bold.otf
    mv ./SF-Pro-Display-BoldItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-BoldItalic.otf
    mv ./SF-Pro-Display-Heavy.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Heavy.otf
    mv ./SF-Pro-Display-HeavyItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-HeavyItalic.otf
    mv ./SF-Pro-Display-Light.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Light.otf
    mv ./SF-Pro-Display-LightItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-LightItalic.otf
    mv ./SF-Pro-Display-Medium.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Medium.otf
    mv ./SF-Pro-Display-MediumItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-MediumItalic.otf
    mv ./SF-Pro-Display-Regular.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Regular.otf
    mv ./SF-Pro-Display-RegularItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-RegularItalic.otf
    mv ./SF-Pro-Display-Semibold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Semibold.otf
    mv ./SF-Pro-Display-SemiboldItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-SemiboldItalic.otf
    mv ./SF-Pro-Display-Thin.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Thin.otf
    mv ./SF-Pro-Display-ThinItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-ThinItalic.otf
    mv ./SF-Pro-Display-Ultralight.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-Ultralight.otf
    mv ./SF-Pro-Italic.ttf $out/share/fonts/sf-pro-fonts/SF-Pro-Italic.ttf
    mv ./SF-Pro-Display-UltralightItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Display-UltralightItalic.otf
    mv ./SF-Pro-Rounded-Black.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Black.otf
    mv ./SF-Pro-Rounded-Bold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Bold.otf
    mv ./SF-Pro-Rounded-Heavy.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Heavy.otf
    mv ./SF-Pro-Rounded-Light.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Light.otf
    mv ./SF-Pro-Rounded-Medium.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Medium.otf
    mv ./SF-Pro-Rounded-Regular.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Regular.otf
    mv ./SF-Pro-Rounded-Semibold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Semibold.otf
    mv ./SF-Pro-Rounded-Thin.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Thin.otf
    mv ./SF-Pro-Rounded-Ultralight.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Rounded-Ultralight.otf
    mv ./SF-Pro-Text-Black.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Black.otf
    mv ./SF-Pro-Text-BlackItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-BlackItalic.otf
    mv ./SF-Pro-Text-Bold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Bold.otf
    mv ./SF-Pro-Text-BoldItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-BoldItalic.otf
    mv ./SF-Pro-Text-Heavy.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Heavy.otf
    mv ./SF-Pro-Text-HeavyItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-HeavyItalic.otf
    mv ./SF-Pro-Text-Light.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Light.otf
    mv ./SF-Pro-Text-LightItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-LightItalic.otf
    mv ./SF-Pro-Text-Medium.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Medium.otf
    mv ./SF-Pro-Text-MediumItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-MediumItalic.otf
    mv ./SF-Pro-Text-Regular.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Regular.otf
    mv ./SF-Pro-Text-RegularItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-RegularItalic.otf
    mv ./SF-Pro-Text-Semibold.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Semibold.otf
    mv ./SF-Pro-Text-SemiboldItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-SemiboldItalic.otf
    mv ./SF-Pro-Text-Thin.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Thin.otf
    mv ./SF-Pro-Text-ThinItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-ThinItalic.otf
    mv ./SF-Pro-Text-Ultralight.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-Ultralight.otf
    mv ./SF-Pro-Text-UltralightItalic.otf $out/share/fonts/sf-pro-fonts/SF-Pro-Text-UltralightItalic.otf
    mv ./SF-Pro.ttf $out/share/fonts/sf-pro-fonts/SF-Pro.ttf
	  '';
}
