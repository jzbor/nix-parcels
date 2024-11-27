# Typst Packages
This repository contains derivations for all of the [Typst packages](https://github.com/typst/packages) exposed under `.#legacyPackages.${system}.typstPackages.*`.
The goal is to be able to use these packages in combination with [Typix](https://github.com/loqusion/typix) in order to deterministically build Typst documents.

You can create package environments via the `typstPackages.withPackages` function and feed the environment to Typst via the `TYPST_PACKAGE_CACHE_PATH` environment variable like so:
```Nix
let
  pkgs = nixpkgs.legacyPackages.${system};
  typixLib = typix.lib.${system};
  fontPaths = [
    "${pkgs.noto-fonts}/share/fonts/noto"
  ];
  typstPackages = parcels.legacyPackages."${system}".typstPackages.withPackages (pkgs: with pkgs; [
    touying
  ]);
in {
  packages.default = typixLib.buildTypstProject {
    src = ./.;
    typstSource = "main.typ";
    TYPST_PACKAGE_CACHE_PATH = typstPackages;
    inherit fontPaths;
  };
};
```

