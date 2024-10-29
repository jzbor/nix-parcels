{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "marmite";
  version = "0.1.7";

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "rochacbruno";
    repo = pname;
    # rev = version;
    rev = "c514af6bd00a2a7eb90d07a58421658303bfab42";
    sha256 = "sha256-pUmeVeR62HJEQQVUagvr2P4xDyNIXB/X3J5CevxEi00=";
  });

  meta = with lib; {
    description = "A Static Site Generator for Blogs ";
    homepage = "https://rochacbruno.github.io/marmite/";
    license = licenses.agpl3Only;
  };
}
