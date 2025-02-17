{ pkgs, lib, craneLib, fetchFromGitHub, ...  }:

craneLib.buildPackage rec {
  pname = "cliflux";
  version = "1.5.0";

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "spencerwi";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-CEsbMZdv84ytVjB/oUnQTfOCsF1PnmJJRL3av/J+9bg=";
  });

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    openssl
  ];

  meta = with lib; {
    description = "A terminal client for Miniflux RSS reader";
    homepage = "https://github.com/spencerwi/cliflux";
    license = licenses.mit;
  };
}
