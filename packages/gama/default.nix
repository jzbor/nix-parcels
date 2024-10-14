{ lib, buildGoModule, fetchFromGitHub, ... }:

buildGoModule rec {
  pname = "gama";
  version = "1.1.4";

  src = fetchFromGitHub {
    owner = "termkit";
    repo = "gama";
    rev = "v${version}";
    hash = "sha256-laE3lW2MX3vYxsF5iHl0sLKCAPRAIZGQs72+vdbX4t0=";
  };
  vendorHash = "sha256-rx18df0iiYqQToydXcA6Kqsn3lePIL1RNMSvD+a4WrI=";

  checkPhase = "";

  # buildInputs = with pkgs; [ sqlite ];

  meta = with lib; {
    description = "GAMA is a powerful terminal-based user interface tool designed to streamline the management of GitHub Actions workflows.";
    homepage = "https://github.com/termkit/gama";
    license = licenses.gpl3;
  };
}
