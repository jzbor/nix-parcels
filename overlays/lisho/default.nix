self: super:

{
  lisho = super.callPackage (
    { pkgs, lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "lisho";
      version = "0.1.3";

      src = fetchFromGitHub {
        owner = "jzbor";
        repo = pname;
        rev = "v${version}";
        sha256 = "sha256-X+3tP1jantlPpyGfmKGrty1JKv1tmsXe7pfoXBYTLTE=";
      };

      cargoLock = {
        lockFile = "${src}/Cargo.lock";
      };

      meta = with lib; {
        description = "A simple personal link shortener with no external dependencies.";
        homepage = "https://github.com/jzbor/lisho";
        license = licenses.mit;
        maintainers = [ maintainers.jzbor ];
      };
    }
  ) {};
}

