{ pkgs, lib, craneLib, fetchFromGitHub, ...  }:

craneLib.buildPackage rec {
  pname = "cliflux";
  version = "1.4.2";

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "spencerwi";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-MkMOH1MANcUO7icY8ajSDJG7zvclUyYR13u8N2tgXyI=";
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
    maintainers = [ maintainers.jzbor ];
  };
}
