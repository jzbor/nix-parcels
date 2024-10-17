{ lib, buildGoModule, fetchFromGitHub, ... }:

buildGoModule rec {
  pname = "neonmodem";
  version = "1.0.6";

  src = fetchFromGitHub {
    owner = "mrusme";
    repo = "neonmodem";
    rev = "v${version}";
    hash = "sha256-VLR6eicffA0IXVwEZMvgpm1kVmrLYVZOtq7MSy+vIw8=";
  };
  vendorHash = "sha256-pESNARoUgfg5/cTlTvKF3i7dTMIu0gRG/oV4Ov6h2cY=";

  meta = with lib; {
    description = "Neon Modem Overdrive";
    homepage = "https://github.com/mrusme/neonmodem";
    license = licenses.mit;
  };
}
