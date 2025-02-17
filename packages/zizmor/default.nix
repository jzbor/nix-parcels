{ pkgs, lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "zizmor";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "woodruffw";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-NydP0p8R7rNDZedsefKScVfSkqfZmvGjtvttph2BJK4=";
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
