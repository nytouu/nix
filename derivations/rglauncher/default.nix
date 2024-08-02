{ fetchFromGitHub, pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  name = "rglauncher";
  src = fetchFromGitHub {
    owner = "aeghn";
    repo = "rglauncher";
    rev = "f515509b9d9258e8878bb41bc376767ba15a0be9";
    sha256 = "1d0q961bizj4bpisxp9kf5i6brma0yq2c95df2add7fz0lnjf13h";
  };

  buildInputs = with pkgs; [
    rust
    cargo
  ];

  installPhase = ''
    cargo install $out/bin/rglauncher
  '';
}
