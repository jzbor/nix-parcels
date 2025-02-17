{ lib, buildGoModule, fetchFromGitHub, ... }:

buildGoModule rec {
  pname = "obligator";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "lastlogin-io";
    repo = "obligator";
    rev = version;
    hash = "sha256-4+9qUsyoBUphpVm0hDI0MYCJ1fUlBCAggcqVQJhILp0=";
  };
  vendorHash = "sha256-snI3htyuBeeTOND8X5Wi+3WEW5xC+Y+C8jMfmiYAur4=";

  # buildInputs = with pkgs; [ sqlite ];

  # Enable CGO if SQLite support is required.
  CGO_ENABLED = "1";

  meta = with lib; {
    description = "Simple and opinionated OpenID Connect server designed for self-hosters";
    homepage = "https://www.lastlogin.io/";
    license = licenses.mit;
  };
}
