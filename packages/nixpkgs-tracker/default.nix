{ pkgs, pnpm, fetchFromGitHub, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "nixpkgs-tracker";
  version = "unstable-2024-10-29";

  src = fetchFromGitHub {
    owner = "ocfox";
    repo = pname;
    rev = "e9394c41c207e26b66bda737591b700e3f545782";
    sha256 = "sha256-7pNN+ZAl2Aj5HEG1rzAJFCBtFc2VAwC9NxyCajb18qg=";
  };

  pnpmDeps = pnpm.fetchDeps {
    inherit pname version src;
    hash = "sha256-zeSy2HwF0pBXmPRyjDkg2KpDE5sOU3auDLNk2vQ3sdk=";
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
