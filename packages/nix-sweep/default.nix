{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.1.6";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-d/LnJe2NyNJQjpdeMyLOb08ozlXKVbXM2H06xdiT740=";
  };

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
