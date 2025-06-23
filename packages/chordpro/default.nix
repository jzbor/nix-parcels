{ pkgs, ... }:

pkgs.perlPackages.buildPerlPackage {
  pname = "App-Music-ChordPro";
  version = "6.070";
  src = pkgs.fetchurl {
    url = "mirror://cpan/authors/id/J/JV/JV/App-Music-ChordPro-6.070.tar.gz";
    hash = "sha256-j1YKVwkqJz8LAcmeHlh7kBaFGM4ZlyUHEHN5w0V6zwc=";
  };
  propagatedBuildInputs = with pkgs.pkgs.perlPackages; [
    AppPackager
    DataPrinter
    FileHomeDir
    FileLoadLines
    IOString
    ImageInfo
    JSONXS
    LWPProtocolHttps
    ListAllUtils
    MozillaCA
    ObjectPad
    PDFAPI2
    RefUtil
    StringInterpolateNamed
    TextLayout
  ];
  nativeBuildInputs = [ pkgs.shortenPerlShebang ];
  postInstall = ''
      shortenPerlShebang $out/bin/chordpro
      rm $out/bin/wxchordpro # Wx not supported in this build
  '';
  meta = {
    description = "A lyrics and chords formatting program";
    homepage = "https://www.chordpro.org";
    license = with pkgs.lib.licenses; [ artistic1 gpl1Plus ];
    mainProgram = "chordpro";
  };
  doCheck = false;
}
