self: super:

{
  marswm = super.callPackage (
    { pkgs, lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "marswm";
      version = "0.3.2";

      src = fetchFromGitHub {
        owner = "jzbor";
        repo = pname;
        rev = version;
        sha256 = "sha256-5zhOI5yKboHrhE5bdAtU/FZRjn3bQUff5HF4XShnTmw=";
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
