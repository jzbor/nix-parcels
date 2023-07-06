self: super:

{
  kanagawa-gtk-theme = super.callPackage (
    { lib , stdenv , fetchFromGitHub }:

    stdenv.mkDerivation rec {
      pname = "kanagawa-gtk-theme";
      version = "";

      src = fetchFromGitHub {
        owner = "Fausto-Korpsvart";
        repo = "Kanagawa-GKT-Theme";
        rev = "35936a1e3bbd329339991b29725fc1f67f192c1e";
        sha256 = "sha256-BZRmjVas8q6zsYbXFk4bCk5Ec/3liy9PQ8fqFGHAXe0=";
      };

      dontPatchELF = true;
      dontRewriteSymlinks = true;
      dontDropIconThemeCache = true;

      installPhase = ''
        mkdir -p $out/share/icons/
        mkdir -p $out/share/themes/
        cp -r icons/Kanagawa $out/share/icons/
        cp -r themes/Kanagawa-B $out/share/themes/
        cp -r themes/Kanagawa-B-LB $out/share/themes/
        cp -r themes/Kanagawa-BL $out/share/themes/
        cp -r themes/Kanagawa-BL-LB $out/share/themes/
        rm -r *
      '';

      meta = with lib; {
        description = "A GTK theme with the Kanagawa colour palette";
        homepage = src.meta.homepage;
        license = licenses.gpl3Only;
        platforms = platforms.all;
      };
    }
  ) {};
}
