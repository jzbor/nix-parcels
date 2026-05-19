{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "chainsaw";
  version = "2.16.0";
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "WithSecureLabs";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-ywHPDVHpw0TrzeWPzZ3cvQSxCr2Di2YjS0Not1B9vlg=";
  };

  cargoArtifacts = craneLib.buildDepsOnly {
    inherit src strictDeps;
  };

  meta = with lib; {
    description = "Rapidly Search and Hunt through Windows Forensic Artefacts";
    homepage = "https://github.com/WithSecureLabs/chainsaw";
    license = licenses.gpl3Only;
  };
}
