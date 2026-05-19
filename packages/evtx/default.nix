{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "evtx";
  version = "0.11.2";
  strictDeps = true;
  doCheck = false;

  src = fetchFromGitHub {
    owner = "omerbenamram";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-LVGw/u5xq+m96zSMPbQDpMnfMHq7FyQnzkmGMUMVgwM=";
  };

  cargoArtifacts = craneLib.buildDepsOnly {
    inherit src strictDeps;
  };

  meta = with lib; {
    description = "A Fast (and safe) parser for the Windows XML Event Log (EVTX) format";
    homepage = "https://github.com/omerbenamram/evtx";
    license = licenses.mit;
  };
}
