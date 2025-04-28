{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-ygx5FTL5A5FbG/c2WWH6AWdrYqwsLVL+9kar2Wz/0jo=";
  };

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations and left-over garbage collection roots";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
