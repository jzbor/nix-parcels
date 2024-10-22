{ pkgs, inputs, ... }:

pkgs.stdenvNoCC.mkDerivation {
  name = "typst-packages";
  src = "${inputs.typst-packages}/packages";
  dontBuild = true;
  installPhase = ''
        mkdir -p "$out/typst/packages"
        cp -LR --reflink=auto --no-preserve=mode -t "$out/typst/packages" "$src"/*
  '';
}

