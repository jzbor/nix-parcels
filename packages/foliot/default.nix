{ lib, rustPlatform, fetchFromGitHub, pkgs, ... }:

rustPlatform.buildRustPackage rec {
  pname = "foliot";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = version;
    sha256 = "sha256-4Pv9CqgD6vGoZw0gwMgNhi6m7zVjON7HUiUObJ42CSU=";
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
