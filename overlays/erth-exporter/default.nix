self: super:

{
  erth-exporter = super.callPackage (
    { pkgs, lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "erth-exporter";
      version = "0.3.0";

      src = fetchFromGitHub {
        owner = "jzbor";
        repo = pname;
        rev = "v${version}";
        sha256 = "sha256-affZ18mFDqTnRMxsI5Cu+Xu/hkhbQqldvKP6vvMX9S4=";
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

