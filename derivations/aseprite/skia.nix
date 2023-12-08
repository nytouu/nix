{ stdenv, fetchFromGitHub, fetchgit, pkgs ? import <nixpkgs> {} }:

let
  # skia-deps.nix is generated by: ./skia-make-deps.sh 'angle2|dng_sdk|piex|sfntly'
  depSrcs = import ./skia-deps.nix { inherit fetchgit; };
in
stdenv.mkDerivation {
  pname = "skia";
  version = "aseprite-m102";

  src = fetchFromGitHub {
    owner = "aseprite";
    repo = "skia";
    # latest commit from aseprite-m102 branch
    rev = "861e4743af6d9bf6077ae6dda7274e5a136ee4e2";
    hash = "sha256-IlZbalmHl549uDUfPG8hlzub8TLWhG0EsV6HVAPdsl0=";
  };

  nativeBuildInputs = with pkgs; [ python3 gn ninja ];

  buildInputs = with pkgs; [
    fontconfig expat icu58 libglvnd libjpeg libpng libwebp zlib
    mesa libX11 harfbuzzFull
  ];

  preConfigure = with depSrcs; ''
    mkdir -p third_party/externals
    ln -s ${angle2} third_party/externals/angle2
    ln -s ${dng_sdk} third_party/externals/dng_sdk
    ln -s ${piex} third_party/externals/piex
    ln -s ${sfntly} third_party/externals/sfntly
  '';

  configurePhase = ''
    runHook preConfigure
    gn gen out/Release --args="is_debug=false is_official_build=true extra_cflags=[\"-I${pkgs.harfbuzzFull.dev}/include/harfbuzz\"]"
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    ninja -C out/Release skia modules
    runHook postBuild
  '';

  installPhase = ''
    mkdir -p $out

    # Glob will match all subdirs.
    shopt -s globstar

    # All these paths are used in some way when building aseprite.
    cp -r --parents -t $out/ \
      include/codec \
      include/config \
      include/core \
      include/effects \
      include/gpu \
      include/private \
      include/utils \
      include/third_party/skcms/*.h \
      out/Release/*.a \
      src/gpu/**/*.h \
      src/core/*.h \
      modules/skshaper/include/*.h \
      third_party/externals/angle2/include \
      third_party/skcms/**/*.h
  '';
}
