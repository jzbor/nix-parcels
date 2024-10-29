{ pkgs, pnpm, fetchFromGitHub, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "nixpkgs-tracker";
  version = "unstable-2024-10-29";

  src = fetchFromGitHub {
    owner = "ocfox";
    repo = pname;
    rev = "f0e3bf22da5510f1a1fabf8b8fd38de119927700";
    sha256 = "sha256-tzmXIUbznP6sW++IBNONncPTweDr9WM+N+vfGlj74qs=";
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
