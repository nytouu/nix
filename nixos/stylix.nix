{ pkgs, ... }:

{
  stylix = {
		enable = true;
		# image = ./wallpaper.png;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/google-dark.yaml";
		stylix.polarity = "either";

    cursor = {
      name = "Notwaita-Black";
      package = pkgs.callPackage ../derivations/notwaita-cursor/default.nix { };
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "MartianMono" ]; };
        name = "MartianMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.callPackage ../derivations/torus-pro/default.nix { };
        name = "Torus Pro";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
    };
  };
}
