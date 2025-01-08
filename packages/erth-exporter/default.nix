{ craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "erth-exporter";
  version = "0.3.4";

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-IhJTuMmbkH0hL70Ot7KkwY9155lQx82/sRxtwsHs+u0=";
  });

  meta = {
    description = "Prometheus erth-exporter";
    homepage = "https://github.com/jzbor/erth-exporter";
  };
}
