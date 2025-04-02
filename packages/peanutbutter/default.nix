{ pkgs, lib, craneLib, fetchFromSourcehut, ... }:

craneLib.buildPackage rec {
  pname = "peanutbutter";
  version = "0.5.1";

  src = craneLib.cleanCargoSource (fetchFromSourcehut {
    owner = "~anjan";
    repo = pname;
    rev = version;
    sha256 = "sha256-XMPy6KPm36fciWgjMQrKGJyry0DvVQxlxOEK3DhoSgY=";
  });

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    pango
  ];

  meta = with lib; {
    description = "A wayland screen locker for touch-based Linux mobile devices";
    homepage = "https://git.sr.ht/~anjan/peanutbutter";
    license = licenses.agpl3Only;
  };
}
