{ fetchurl, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "autodesk-maya";
  src = fetchurl {
    url = "https://github.com/yamatsum/nonicons/raw/master/dist/nonicons.ttf";
    sha256 = "1k580v8jrjmzx7v5sg1svj92k8r5bvzjzflz7gys6kn4arc0c2ns";
  };
}
