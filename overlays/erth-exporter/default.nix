self: super:

{
  erth-exporter = super.callPackage (
    { pkgs, lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "erth-exporter";
      version = "0.3.1";

      src = fetchFromGitHub {
        owner = "jzbor";
        repo = pname;
        rev = "v${version}";
        sha256 = "sha256-DbG9Lr9/ZdJMbn7EuOV5chW3FcRoQ4PY3awxBXriU5Y=";
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

