{ lib, fetchFromGitHub, craneLibStatic, ... }:

craneLibStatic.buildPackage rec {
  pname = "deadnix";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "astro";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-xaaXGzTd+t1GjD2KpiS/c8acv6bXufv/lTN+ACRGVJw=";
  };

  CARGO_BUILD_TARGET = "x86_64-unknown-linux-musl";
  CARGO_BUILD_RUSTFLAGS = "-C target-feature=+crt-static";

  meta = with lib; {
    description = "Scan Nix files for dead code";
    homepage = "https://github.com/astro/deadnix";
    license = licenses.gpl3;
  };
}
