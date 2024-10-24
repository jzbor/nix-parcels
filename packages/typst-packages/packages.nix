inputs: pkgs:

with builtins;
let
  mkTypstPkg = name: pkgs.stdenvNoCC.mkDerivation {
    name = "typst-package-${name}";
    src = "${inputs.typst-packages}/packages";
    dontBuild = true;
    dontUnpack = true;  # for speed
    dontFixup = true;   # for speed
    installPhase = ''
      mkdir -p "$out/preview"
      cp -LR --reflink=auto --no-preserve=mode -t "$out/preview" "$src"/preview/${name}
    '';

  };
  packages = listToAttrs (map (name: {
    inherit name;
    value = mkTypstPkg name;
  }) (import ./package_names.nix));
in packages // {
  all = pkgs.symlinkJoin {
    name = "typst-packages";
    paths = attrValues packages;
  };
  src = inputs.typst-packages.outPath;
  withPackages = f: pkgs.symlinkJoin {
    name = "typst-package-env";
    paths = f packages;
  };
}
