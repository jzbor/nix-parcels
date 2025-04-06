{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "pinenotectl";
  version = "0.1.0";

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-iBVrh4Bj5qVm5sii+yJ2QgHmd6VOheQqXtvpXSENbe0=";
  });

  meta = with lib; {
    description = "Control the PineNote's special features";
    homepage = "https://github.com/jzbor/pinenotectl";
    license = licenses.mit;
  };
}
