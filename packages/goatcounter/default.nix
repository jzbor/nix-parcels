# source: https://github.com/connorfeeley/goatcounter-flake
{ pkgs, lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "goatcounter";
  version = "2.5.0";

  src = fetchFromGitHub {
    owner = "arp242";
    repo = "goatcounter";
    rev = "v${version}";
    hash = "sha256-lwiLk/YYxX4QwSDjpU/mAikumGXYMzleRzmPjZGruZU=";
  };
  vendorHash = "sha256-YAb3uBWQc6hWzF1Z5cAg8RzJQSJV+6dkppfczKS832s=";

  subPackages = "cmd/goatcounter";

  buildInputs = with pkgs; [ postgresql sqlite ];

  # Enable CGO if SQLite support is required.
  CGO_ENABLED = "1";
  # Set version.
  ldflags = [ "-X zgo.at/goatcounter/v2.Version=${version}" ];

  meta = with lib; {
    description = "Privacy-focused, self-hosted web analytics";
    homepage = "https://www.goatcounter.com/";
    license = licenses.mit;
    maintainers = with maintainers; [ cfeeley ];
  };
}
