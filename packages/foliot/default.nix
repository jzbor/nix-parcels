{ pkgs, lib, rustPlatform, fetchFromGitHub, ... }:

rustPlatform.buildRustPackage rec {
  pname = "foliot";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = version;
    sha256 = "sha256-ZQaC4XDgQg93HqYQa4Bh646JxurqM+3sxjcQHrfXNHI=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    xorg.libXrandr
  ];

  meta = with lib; {
    description = "A simple time tracking tool to keep track of your working or studying time.";
    homepage = "https://github.com/jzbor/foliot";
    license = licenses.mit;
    maintainers = [ maintainers.jzbor ];
  };
}
