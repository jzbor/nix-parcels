{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "pinenotectl";
  version = "0.2.0";

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-W59tsU2PmnT/LFTg20hQcdu5Smy1BWnS+9NtDkScZ10=";
  });

  meta = with lib; {
    description = "Control the PineNote's special features";
    homepage = "https://github.com/jzbor/pinenotectl";
    license = licenses.mit;
  };
}
