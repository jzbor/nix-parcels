{ pkgs, lib, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "nix-sweep";
  version = "0.5.1";
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "jzbor";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-rxsEw1fkonCbyTFn+PdNvefk5gMLtt/G8nAJi5TUMqo=";
  };

  cargoArtifacts = craneLib.buildDepsOnly {
    inherit src strictDeps;
  };

  nativeBuildInputs = with pkgs; [
    makeWrapper
    installShellFiles
  ];

  postFixup = ''
    wrapProgram $out/bin/nix-sweep \
    --set PATH ${pkgs.lib.makeBinPath [ pkgs.nix ]}
  '';

  postInstall = ''
    mkdir ./manpages
    $out/bin/nix-sweep man ./manpages
    installManPage ./manpages/*
  '';

  meta = with lib; {
    description = "Utility to clean up old Nix profile generations and left-over garbage collection roots";
    homepage = "https://github.com/jzbor/nix-sweep";
    license = licenses.mit;
  };
}
