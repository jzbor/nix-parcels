{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-fzUla8zJUJzaakfDj6rKQvf1tkW/NJisd7pJlRMyV/c=";
  };

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
