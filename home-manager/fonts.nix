{ pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = "Liga SFMono Nerd Font";
      sansSerif = "SF Pro Display";
      serif = "Noto Serif";
    };
  };
}
