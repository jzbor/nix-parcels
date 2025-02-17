{ lib, buildGoModule, fetchFromGitHub, ... }:

buildGoModule rec {
  pname = "gama";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "termkit";
    repo = "gama";
    rev = "v${version}";
    hash = "sha256-ISgORjzH7ZigQYm7PSA4ZClhpw2GU7yor580fEf5UNc=";
  };
  vendorHash = "sha256-PTyrSXLMr244+ZTvjBBUc1gmwYXBAs0bXZS2t3aSWFQ=";

  checkPhase = "";

  # buildInputs = with pkgs; [ sqlite ];

  meta = with lib; {
    description = "GAMA is a powerful terminal-based user interface tool designed to streamline the management of GitHub Actions workflows.";
    homepage = "https://github.com/termkit/gama";
    license = licenses.gpl3;
  };
}
