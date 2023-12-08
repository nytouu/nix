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
  name = "sddm-corners";
  src = pkgs.fetchFromGitHub {
    owner = "aczw";
	repo = "sddm-theme-corners";
	rev = "a76d4517f163bbc7787f51ab074a0357bbf5e527";
	sha256 = "0nzn6g5rix6sz83wp7yy6gi9p15xd8m27ff9ff3w0ww3s48iv94y";
  };
  installPhase = ''
	  mkdir -p $out
	  cp -R ./corners/* $out/
	  '';
	 # cd $out/
	 # rm Background.jpg
	 # cp -r ${image} $out/Background.jpg
}
