{ pkgs, lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "zizmor";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "woodruffw";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-IFo/sZyZT/oqVB1AS3MSJLbSDVFXKccyF4LU1DAKnEE=";
  };

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    openssl
  ];

  meta = with lib; {
    description = "A tool for finding security issues in GitHub Actions setups.";
    homepage = "https://crates.io/crates/zizmor";
    license = licenses.mit;
  };
}
