{ lib, rustPlatform, fetchFromGitHub, ... }:

rustPlatform.buildRustPackage rec {
  pname = "erth-exporter";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-bXO0K57xt0Pik8yTYCIK8TAmheXOWgAM/ECWZ7d+SK8=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  meta = with lib; {
    description = "Prometheus erth-exporter";
    homepage = "https://github.com/jzbor/erth-exporter";
    # license = licenses.mit;
    maintainers = [ maintainers.jzbor ];
  };
}
