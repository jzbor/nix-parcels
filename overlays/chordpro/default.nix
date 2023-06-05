self: super:

{
  chordpro = super.pkgs.perlPackages.buildPerlPackage {
    pname = "App-Music-ChordPro";
    version = "6.010";
    src = super.fetchurl {
      url = "mirror://cpan/authors/id/J/JV/JV/App-Music-ChordPro-6.010.tar.gz";
      hash = "sha256-SqTkbR2bWIMcU5gSRf2WW6s1ckHtJVPkxj/bBO9X4kM=";
    };
    buildInputs = with super.pkgs.perlPackages; [ PodParser ];
    propagatedBuildInputs = with super.pkgs.perlPackages; [ AppPackager FileLoadLines IOString ImageInfo PDFAPI2 StringInterpolateNamed TextLayout ]
      ++ super.lib.optionals (!super.stdenv.isDarwin) [ Wx ];
    nativeBuildInputs = super.lib.optional super.stdenv.isDarwin super.shortenPerlShebang;
    postInstall = super.lib.optionalString super.stdenv.isDarwin ''
      shortenPerlShebang $out/bin/chordpro
      rm $out/bin/wxchordpro # Wx not supported on darwin
    '';
    meta = {
      description = "A lyrics and chords formatting program";
      homepage = "https://www.chordpro.org";
      license = with super.lib.licenses; [ artistic1 gpl1Plus ];
      mainProgram = "chordpro";
    };
    doCheck = false;
  };
}
