{ lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "lisho";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-3wR/3ggh3TkTcRCPj8dvJsVhrEa6KzzHKvdBhQFBiBQ=";
  };

  meta = with lib; {
    description = "A simple personal link shortener with no external dependencies.";
    homepage = "https://github.com/jzbor/lisho";
    license = licenses.mit;
    maintainers = [ maintainers.jzbor ];
  };
}
