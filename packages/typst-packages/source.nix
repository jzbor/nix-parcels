{ inputs, pkgs, ...}: pkgs.symlinkJoin {
  name = "typst-packages-source";
  paths = [ inputs.typst-packages.outPath ];
}
