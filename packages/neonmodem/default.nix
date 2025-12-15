{ lib, buildGoModule, fetchFromGitHub, ... }:

buildGoModule rec {
  pname = "neonmodem";
  version = "1.0.7";

  src = fetchFromGitHub {
    owner = "mrusme";
    repo = "neonmodem";
    rev = "v${version}";
    hash = "sha256-gwhQG8H1OnGQmawPQ3m6VKVooBh8rZaNr6FDl6fgZXc=";
  };
  vendorHash = "sha256-zqQtuyFrsDB1xRdl4cbaTsCawMrBvcu78zXgU2jUwHI=";

  meta = with lib; {
    description = "Neon Modem Overdrive";
    homepage = "https://github.com/mrusme/neonmodem";
    license = licenses.mit;
  };
}
