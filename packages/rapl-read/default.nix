{ pkgs, lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "rapl-read";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "deater";
    repo = "uarch-configure";
    rev = "bc635a5e55e01f5248857ac4af48f91a2519cb31";
    sha256 = "sha256-RcaMqKEDlFNd6ZU9kE+9ExsBOzU+AWCwG3ZHVjkHoO0=";
  };

  meta = with lib; {
    description = "Quick hack showing RAPL read functionality.";
    homepage = "https://github.com/deater/uarch-configure";
    license = licenses.gpl2;
    maintainers = [ maintainers.jzbor ];
  };

  nativeBuildInputs = with pkgs; [
    gcc
  ];

  buildPhase = ''
      cc -O2 -Wall -o rapl-read/rapl-read rapl-read/rapl-read.c -lm
      cc -O2 -Wall -o rapl-read/rapl-plot rapl-read/rapl-plot.c -lm
  '';

  installPhase = ''
      mkdir -vp $out/bin
      cp rapl-read/rapl-read $out/bin/rapl-read
      cp rapl-read/rapl-plot $out/bin/rapl-plot
  '';
}
