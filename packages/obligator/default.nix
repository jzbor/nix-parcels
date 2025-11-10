{ lib, buildGoModule, fetchFromGitHub, ... }:

buildGoModule {
  pname = "obligator";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "lastlogin-io";
    repo = "obligator";
    rev = "37f75cc861f1bcd0dbf0f26a58e0f45bdae032ff";
    hash = "sha256-Di4nH/veqp1dTwJBavRENOI/NMsvhNtgN0QZ4OU4lfw=";
  };
  vendorHash = "sha256-snI3htyuBeeTOND8X5Wi+3WEW5xC+Y+C8jMfmiYAur4=";

  # buildInputs = with pkgs; [ sqlite ];

  # Enable CGO if SQLite support is required.
  env.CGO_ENABLED = "1";

  meta = with lib; {
    description = "Simple and opinionated OpenID Connect server designed for self-hosters";
    homepage = "https://www.lastlogin.io/";
    license = licenses.mit;
  };
}
