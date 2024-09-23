{ craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "erth-exporter";
  version = "0.3.3";

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Iwz/bsw4qbavYgvMqDEfqqC/H9ZMF+Dspl9zajzAh4I=";
  });

  meta = {
    description = "Prometheus erth-exporter";
    homepage = "https://github.com/jzbor/erth-exporter";
  };
}
