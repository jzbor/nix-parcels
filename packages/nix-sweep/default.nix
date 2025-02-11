{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-hpg900Dez9dKwIensszKyFOXk3xem78rdBkC74era8A=";
  };

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
