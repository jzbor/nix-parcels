{ pkgs, lib, rustPlatform, fetchFromGitHub, ... }:

rustPlatform.buildRustPackage rec {
  pname = "decap_oauth";
  version = "unstable";

  buildInputs = with pkgs; [ openssl ];
  nativeBuildInputs = with pkgs; [ pkg-config ];

  src = fetchFromGitHub {
    owner = "augustogunsch";
    repo = pname;
    rev = "adc8bedb3b9077f0b6a0ee8b5037302a2318295d";
    sha256 = "sha256-+u88zI53rbllZ0MDKC6FW963hw2j2ShnQXPw9fArzg8=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  meta = with lib; {
    description = "External OAuth provider for Decap CMS.";
    homepage = "https://github.com/augustogunsch/decap_oauth";
    license = licenses.mit;
  };
}
