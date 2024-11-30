{ pkgs, lib, craneLib, fetchFromGitHub, ...  }:

let
  pname = "millet";
  version =  "0.14.7";
  meta = with lib; {
    description = "A language server for Standard ML.";
    homepage = "https://github.com/azdavis/millet";
    license = licenses.mit;
  };

  unwrapped = craneLib.buildPackage {
    pname = "${pname}-unwrapped";
    inherit version meta;

    doCheck = false;

    src = fetchFromGitHub {
      owner = "azdavis";
      repo = pname;
      rev = "v" + version;
      sha256 = "sha256-nj/ueMQSAqdcAG5jaSZBOHd4D4l7xD3i+LO9MUYsz0c=";
    };

    patches = [ ./cargo-config.patch ];
  };
in pkgs.stdenvNoCC.mkDerivation {
  inherit pname version meta;

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    ln -s ${unwrapped}/bin/millet-ls $out/bin/millet
    ln -s ${unwrapped}/bin/millet-cli $out/bin/millet-cli
  '';
}
