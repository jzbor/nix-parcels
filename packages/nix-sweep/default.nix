{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-iFUAvY+lTJScB4xeBz1wSr9QV4xCn55IVW68sALNTQ8=";
  };

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
