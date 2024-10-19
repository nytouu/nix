{ fetchurl, pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  name = "gauntlet-bin";
  version = 10;
  src = fetchurl {
    url = "https://github.com/project-gauntlet/gauntlet/releases/download/v${version}/gauntlet-x86_64-linux.tar.gz";
    sha256 = "1e8096688b110fde91dada275e6a2fc6de353a6528786597772ff62c2a2c391d";
  };

  buildInputs = [ pkgs.unrar ];

  unpackPhase = "unrar x $src";

  installPhase = ''
     install -Dm755 "$src/gauntlet" "$out/bin/gauntlet"
     install -Dm644 "$src/gauntlet.desktop" "$out/share/applications/gauntlet.desktop"
     install -Dm644 "$src/gauntlet.png" "$out/share/icons/hicolor/256x256/apps/gauntlet.png"
     install -Dm644 "$src/gauntlet.service" "$out/lib/systemd/user/gauntlet.service"
  '';

}
