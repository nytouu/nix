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
      buildInputs = oldAttrs.buildInputs ++ [ xorg.libXinerama xorg.libXcursor harfbuzz gd ];
    }))
    (tabbed.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "nytouu";
        repo = "tabbed";
        rev = "e45c7817ec53c6ad4e8e59c999f2b6132bd52062";
        sha256 = "1hv3xbybw2fr20di1plw964rff7j0x4mbb1ghg80ygg39qdpj5di";
      };
      buildInputs = oldAttrs.buildInputs;
    }))
  ];
}
