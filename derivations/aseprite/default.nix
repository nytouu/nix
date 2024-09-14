{ stdenv, callPackage, fetchFromGitHub, pkgs ? import <nixpkgs> {} }:

# Unfree version is not redistributable:
# https://dev.aseprite.org/2016/09/01/new-source-code-license/
# Consider supporting the developer: https://aseprite.org/#buy

let
  skia = callPackage ./skia.nix {};
in
stdenv.mkDerivation rec {
  pname = "aseprite";
  version = "1.3.2";

  src = fetchFromGitHub {
    owner = "aseprite";
    repo = "aseprite";
    rev = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-KUdJA6HTAKrLT8xrwFikVDbc5RODysclcsEyQekMRZo=";
  };

  nativeBuildInputs = with pkgs; [
    cmake pkg-config ninja
  ];

  buildInputs = with pkgs; [
    curl freetype giflib libjpeg libpng libwebp pixman tinyxml zlib
    xorg.libX11 xorg.libXext xorg.libXcursor xorg.libXxf86vm
    cmark
    harfbuzz glib fontconfig pcre
    skia libGL xorg.libXi
  ];

  patches = [
    ./shared-libwebp.patch
    ./shared-skia-deps.patch
  ];

  postPatch = ''
    sed -i src/ver/CMakeLists.txt -e "s-set(VERSION \".*\")-set(VERSION \"$version\")-"
  '';

  cmakeFlags = [
    "-DENABLE_UPDATER=OFF"
    "-DUSE_SHARED_CURL=ON"
    "-DUSE_SHARED_FREETYPE=ON"
    "-DUSE_SHARED_GIFLIB=ON"
    "-DUSE_SHARED_JPEGLIB=ON"
    "-DUSE_SHARED_LIBPNG=ON"
    "-DUSE_SHARED_LIBWEBP=ON"
    "-DUSE_SHARED_PIXMAN=ON"
    "-DUSE_SHARED_TINYXML=ON"
    "-DUSE_SHARED_ZLIB=ON"
    "-DUSE_SHARED_CMARK=ON"
    "-DUSE_SHARED_HARFBUZZ=ON"
    "-DUSE_SHARED_WEBP=ON"
    # Disable libarchive programs.
    "-DENABLE_CAT=OFF"
    "-DENABLE_CPIO=OFF"
    "-DENABLE_TAR=OFF"
    # UI backend.
    "-DLAF_WITH_EXAMPLES=OFF"
    "-DLAF_OS_BACKEND=skia"
    "-DENABLE_DESKTOP_INTEGRATION=ON"
    "-DSKIA_DIR=${skia}"
    "-DSKIA_LIBRARY_DIR=${skia}/out/Release"
  ];

  postInstall = ''
    # Install desktop icons.
    src="$out/share/aseprite/data/icons"
    for size in 16 32 48 64; do
      dst="$out"/share/icons/hicolor/"$size"x"$size"
      install -Dm644 "$src"/ase"$size".png "$dst"/apps/aseprite.png
      install -Dm644 "$src"/doc"$size".png "$dst"/mimetypes/aseprite.png
    done
    # Delete unneeded artifacts of bundled libraries.
    rm -rf "$out"/include "$out"/lib
  '';

  passthru = { inherit skia; };
}
