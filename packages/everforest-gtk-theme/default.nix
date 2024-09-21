{ lib , stdenv , fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "everforest-gtk-theme";
  version = "";

  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Everforest-GTK-Theme";
    rev = "8481714cf9ed5148694f1916ceba8fe21e14937b";
    sha256 = "sha256-NO12ku8wnW/qMHKxi5TL/dqBxH0+cZbe+fU0iicb9JU=";
  };

  dontPatchELF = true;
  dontRewriteSymlinks = true;
  dontDropIconThemeCache = true;

  installPhase = ''
    mkdir -p $out/share/icons/
    mkdir -p $out/share/themes/
    cp -r icons/Everforest-Dark $out/share/icons/
    cp -r icons/everforest_light $out/share/icons/
    cp -r themes/Everforest-Dark-B-LB $out/share/themes/
    cp -r themes/Everforest-Dark-B $out/share/themes/
    cp -r themes/Everforest-Dark-BL-LB $out/share/themes/
    cp -r themes/Everforest-Dark-BL $out/share/themes/
    cp -r themes/Everforest-Light-B-LB $out/share/themes/
    cp -r themes/Everforest-Light-B $out/share/themes/
    cp -r themes/Everforest-Light-BL-LB $out/share/themes/
    cp -r themes/Everforest-Light-BL $out/share/themes/
    rm -r *
  '';

  meta = with lib; {
    inherit (src.meta) homepage;
    description = "Everforest colour palette for GTK";
    license = licenses.gpl3Only;
    platforms = platforms.all;
  };
}
