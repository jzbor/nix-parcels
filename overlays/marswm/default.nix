self: super:

{
  marswm = super.callPackage (
    { pkgs, lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "marswm";
      version = "unstable-2023-05-03";

      src = fetchFromGitHub {
        owner = "jzbor";
        repo = pname;
        rev = "3809556ae451a5ff4b461720351d032ffb69cba7";
        sha256 = "sha256-s0Ym8p7gppl9VLfoZnZHGfP2HVCm08PgmjQyqOtARXE=";
      };

      cargoLock = {
        lockFile = "${src}/Cargo.lock";
      };

      nativeBuildInputs = with pkgs; [
        pkg-config
      ];

      buildInputs = with pkgs; [
        xmenu
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
        xorg.libXrandr
      ];

      meta = with lib; {
        description = "A modern window manager featuring dynamic tiling (rusty successor to moonwm).";
        homepage = "https://github.com/jzbor/marswm";
        license = licenses.mit;
        maintainers = [ maintainers.jzbor ];
      };
    }
  ) {};
}
