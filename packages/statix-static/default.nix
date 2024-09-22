{ lib, fetchFromGitHub, craneLibStatic, ... }:

craneLibStatic.buildPackage rec {
  pname = "statix";
  version = "0.5.8";

  src = fetchFromGitHub {
    owner = "oppiliappan";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-bMs3XMiGP6sXCqdjna4xoV6CANOIWuISSzCaL5LYY4c=";
  };

  CARGO_BUILD_TARGET = "x86_64-unknown-linux-musl";
  CARGO_BUILD_RUSTFLAGS = "-C target-feature=+crt-static";

  meta = with lib; {
    description = "lints and suggestions for the nix programming language";
    homepage = "https://github.com/oppiliappan/statix";
    license = licenses.mit;
    maintainers = [ maintainers.jzbor ];
  };
}
