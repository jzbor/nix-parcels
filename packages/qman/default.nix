{ pkgs, lib, stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation rec {
  pname = "qman";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "plp13";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-z3ILbbwcCYZT8qabVaGnMCyZRag8djEI32i6G7cLL2A=";
  };

  meta = with lib; {
    description = "A more modern man page viewer for our terminals";
    homepage = "https://github.com/plp13/qman";
    license = licenses.bsd2;
  };

  patchPhase = ''
    sed -i '/\[misc\]/a viewer_path=${lib.getExe' pkgs.xdg-utils "xdg-open"}' config/qman.conf
    sed -i '/\[misc\]/a mailer_path=${lib.getExe' pkgs.xdg-utils "xdg-email"}' config/qman.conf
    sed -i '/\[misc\]/a browser_path=${lib.getExe' pkgs.xdg-utils "xdg-open"}' config/qman.conf
    sed -i '/\[misc\]/a apropos_path=${lib.getExe' pkgs.man "apropos"}' config/qman.conf
    sed -i '/\[misc\]/a whatis_path=${lib.getExe' pkgs.man "whatis"}' config/qman.conf
    sed -i '/\[misc\]/a groff_path=${lib.getExe' pkgs.groff "groff"}' config/qman.conf
    sed -i '/\[misc\]/a man_path=${lib.getExe pkgs.man}' config/qman.conf
  '';

  nativeBuildInputs = with pkgs; [
    meson
    ninja
    cmake
    pkg-config
    which
  ];

  buildInputs = with pkgs; [
    ncurses
    groff
    python3Packages.cogapp
    zlib
    bzip2
    xz
    cunit
  ];

  installPhase = ''
    meson install
  '';

  mesonBuildType = "release";
  mesonFlags = ["-Db_lundef=true" "-Dtests=disabled" "-Dconfigdir=etc"];
}
