{ pkgs, fetchFromGitHub, ... }:

let
  pnpm = pkgs.pnpm_9;
in pkgs.stdenv.mkDerivation rec {
  pname = "nixpkgs-tracker";
  version = "unstable-2024-10-29";

  src = fetchFromGitHub {
    owner = "ocfox";
    repo = pname;
    rev = "3f63d55ae90c92db8fb0b5efa2b205a79bce2360";
    sha256 = "sha256-7pNN+ZAl2Aj5HEG1rzAJFCBtFc2VAwC9NxyCajb18qg=";
  };

  pnpmDeps = pnpm.fetchDeps {
    inherit pname version src;
    fetcherVersion = 1;
    hash = "sha256-oYrt0qoVJjc1KiXORkCEvNnqcB9wWj4KX8Q60AQ72r0=";
  };

  nativeBuildInputs = with pkgs; [
    nodejs
    pnpm.configHook
  ];

  buildPhase = "pnpm build";

  installPhase = ''
    runHook preInstall

    mkdir $out
    mv dist/* $out

    runHook postInstall
  '';
}
