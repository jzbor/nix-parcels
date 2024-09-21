{ pkgs, lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "decap_oauth";
  version = "unstable";

  buildInputs = with pkgs; [ openssl ];
  nativeBuildInputs = with pkgs; [ pkg-config ];

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "d1fe0f28e091bfb239fd2124034ce033dc99259c";  #TODO switch to mainline once PR is merged: https://github.com/augustogunsch/decap_oauth/pull/1
    sha256 = "sha256-+u88zI53rbllZ0MDKC6FW963hw2j2ShnQXPw9fArzg8=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  meta = with lib; {
    description = "External OAuth provider for Decap CMS.";
    homepage = "https://github.com/augustogunsch/decap_oauth";
    license = licenses.mit;
    maintainers = [ maintainers.jzbor ];
  };
}
