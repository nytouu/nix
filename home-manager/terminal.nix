{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "nytouu";
        repo = "st";
        rev = "494daa1428a0d7f073df7a3653348ed087f751db";
        sha256 = "1dvffr8jr953nwin3mx9l3rwq4ambrjjhbkss2xdpjp29x3zhhdz";
      };
      buildInputs = oldAttrs.buildInputs ++ [
        xorg.libXinerama
        xorg.libXcursor
        harfbuzz
        gd
      ];
    }))
    (tabbed.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "nytouu";
        repo = "tabbed";
        rev = "e4966ae6c74a3e6f0b11f3b821318d95e89cee16";
        sha256 = "0gy825dqi882a7wddr36dii10pv5nxqg3n1mwnxyg6pna59skcwf";
      };
      buildInputs = oldAttrs.buildInputs;
    }))
  ];
}
