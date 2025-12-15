{ pkgs, fetchFromGitHub, ... }:

let
  pnpm = pkgs.pnpm_9;
in pkgs.stdenv.mkDerivation rec {
  pname = "nixpkgs-tracker";
  version = "unstable-2025-11-27";

  src = fetchFromGitHub {
    owner = "ocfox";
    repo = pname;
    rev = "ef954010622c0c82815f73df21c59c18d2c798a6";
    sha256 = "sha256-+kGgkDCndmowDOzvgXFMtiAhrXKJvmqsw9l1kWvciao=";
  };

  pnpmDeps = pnpm.fetchDeps {
    inherit pname version src;
    fetcherVersion = 1;
    hash = "sha256-1cfVyJz0cjOYd+Rs5aVsWkco4iBeJLwg9NvosKh6+jA=";
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
