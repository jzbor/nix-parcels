self: super:

{
  adi1090x-plymouth = super.callPackage (
    { pkgs, fetchFromGitHub }:

    pkgs.stdenv.mkDerivation rec {
      pname = "adi1090x-plymouth";
      version = "0.0.1";

      src = fetchFromGitHub {
        owner = "adi1090x";
        repo = "plymouth-themes";
        rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
        sha256 = "sha256-mHcEEpoDyM2MHLuhjnmdDyRwsGNPjaar1bMXa890KAk=";
      };

      buildInputs = [
        pkgs.git
      ];

      configurePhase = ''
        mkdir -p $out/share/plymouth/themes/
      '';

      buildPhase = ''
      '';

      installPhase = ''
        cp -r pack_3/lone $out/share/plymouth/themes
        cat pack_3/lone/lone.plymouth | sed  "s@\/usr\/@$out\/@" > $out/share/plymouth/themes/lone/lone.plymouth
      '';
    }
  ) {};
}
