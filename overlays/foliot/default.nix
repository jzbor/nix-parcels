self: super:

{
  foliot = super.callPackage (
    { pkgs, lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "foliot";
      version = "0.3.2";

      src = fetchFromGitHub {
        owner = "jzbor";
        repo = pname;
        rev = version;
        sha256 = "sha256-qx4/CTEF8J+bF67aJUTPFKV7PPJ6PtgcHOsoJ5o7px0=";
      };

      cargoLock = {
        lockFile = "${src}/Cargo.lock";
      };

      nativeBuildInputs = with pkgs; [
        pkg-config
      ];

      buildInputs = with pkgs; [
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
        xorg.libXrandr
      ];

      meta = with lib; {
        description = "A simple time tracking tool to keep track of your working or studying time.";
        homepage = "https://github.com/jzbor/foliot";
        license = licenses.mit;
        maintainers = [ maintainers.jzbor ];
      };
    }
  ) {};
}

