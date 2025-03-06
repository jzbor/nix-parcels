{ pkgs, ... }:

pkgs.perlPackages.buildPerlPackage {
  pname = "App-Music-ChordPro";
  version = "6.010";
  src = pkgs.fetchurl {
    url = "mirror://cpan/authors/id/J/JV/JV/App-Music-ChordPro-6.010.tar.gz";
    hash = "sha256-SqTkbR2bWIMcU5gSRf2WW6s1ckHtJVPkxj/bBO9X4kM=";
  };
  buildInputs = with pkgs.pkgs.perlPackages; [ PodParser ];
  propagatedBuildInputs = with pkgs.pkgs.perlPackages; [ AppPackager FileLoadLines IOString ImageInfo PDFAPI2 StringInterpolateNamed TextLayout ]
  ++ pkgs.lib.optionals (!pkgs.stdenv.isDarwin) [ Wx ];
  nativeBuildInputs = pkgs.lib.optional pkgs.stdenv.isDarwin pkgs.shortenPerlShebang;
  postInstall = pkgs.lib.optionalString pkgs.stdenv.isDarwin ''
      shortenPerlShebang $out/bin/chordpro
      rm $out/bin/wxchordpro # Wx not supported on darwin
  '';
  meta = {
    description = "A lyrics and chords formatting program";
    homepage = "https://www.chordpro.org";
    license = with pkgs.lib.licenses; [ artistic1 gpl1Plus ];
    mainProgram = "chordpro";
  };
  doCheck = false;
}
