{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-l4YkhrUsWzKIwry9+eIdN8uUJltOYpJGjBOEoDzFRPY=";
  };

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations and gc roots";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
