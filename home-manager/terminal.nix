{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "nytouu";
        repo = "st";
        rev = "c3f09a428e67cc353ea12fddeebec21a7bda8fb2";
        sha256 = "1r09fca8yqgq1v5sp8ahmrr9sc9gjwa97i4vi75wi9k6y36bwi6x";
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
