self: super:

{
  erth-exporter = super.callPackage (
    { pkgs, lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "erth-exporter";
      version = "0.1.0";

      src = fetchFromGitHub {
        owner = "jzbor";
        repo = pname;
        rev = "v${version}";
        sha256 = "sha256-8PuNsdBPFPfoqcZcBJX2h0muc7QI3J1qSHKasj6DO2A=";
      };

      cargoLock = {
        lockFile = "${src}/Cargo.lock";
      };

      meta = with lib; {
        description = "Prometheus erth-exporter";
        homepage = "https://github.com/jzbor/erth-exporter";
        # license = licenses.mit;
        maintainers = [ maintainers.jzbor ];
      };
    }
  ) {};
}

