{ lib, craneLib, fetchFromGitHub, ...  }:

craneLib.buildPackage rec {
  pname = "millet";
  version = "0.14.7";

  doCheck = false;

  src = fetchFromGitHub {
    owner = "azdavis";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-nj/ueMQSAqdcAG5jaSZBOHd4D4l7xD3i+LO9MUYsz0c=";
  };

  patches = [ ./cargo-config.patch ];

  meta = with lib; {
    description = "A language server for Standard ML.";
    homepage = "https://github.com/azdavis/millet";
    license = licenses.mit;
  };
}
