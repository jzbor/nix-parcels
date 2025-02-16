{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-OzXVKjL/U+25SLj6SD99WaLltlnlmRL2wLmPAbKIVhc=";
  };

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
