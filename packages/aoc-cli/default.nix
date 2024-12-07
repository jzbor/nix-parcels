{ pkgs, lib, craneLib, fetchFromGitHub, ...  }:

craneLib.buildPackage rec {
  pname = "aoc";
  version =  "0.12.0";
  meta = with lib; {
    description = "Advent of Code command-line tool";
    homepage = "https://github.com/scarvalhojr/aoc-cli";
    license = licenses.mit;
  };

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "scarvalhojr";
    repo = pname;
    rev = version;
    sha256 = "sha256-UdeCKhEWr1BjQ6OMLP19OLWPlvvP7FGAO+mi+bQUPQA=";
  });
}
