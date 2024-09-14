{ fetchFromGitHub, pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  name = "discord-screenaudio";
  src = fetchFromGitHub {
    owner = "maltejur";
    repo = "discord-screenaudio";
    rev = "3f9d21cc86776d28509328394043038dcf7b7b26";
    sha256 = "1siirw8r0n8xfp3k9ai9pzv41jz66cv87dxiplafys1ax56hd7b8";
    fetchSubmodules = true;
  };

  cmakeFlags = with pkgs; [
    "-DPipeWire_INCLUDE_DIRS=${pipewire.dev}/include/pipewire-0.3"
    "-DSpa_INCLUDE_DIRS=${pipewire.dev}/include/spa-0.2"
  ];

  nativeBuildInputs = with pkgs; [
    libsForQt5.qt5.wrapQtAppsHook
    cmake
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtwebengine
    libsForQt5.knotifications
    libsForQt5.kxmlgui
    libsForQt5.kglobalaccel
  ];

  buildInputs = with pkgs; [
    libsForQt5.qt5.qtbase
    pipewire
    pipewire.pulse
    xdg-desktop-portal
    pulseaudio
    libpulseaudio
    systemd
  ];
}
