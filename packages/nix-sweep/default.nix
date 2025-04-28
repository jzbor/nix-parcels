{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-WuIY9/wtBP6wcsi0fXra108tedU+SEy7zpLe3K8UbFc=";
  };

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations and gc roots";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
