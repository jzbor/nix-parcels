inputs: pkgs:

with pkgs.lib;
let
  extraArgs = {
    inherit inputs;
    craneLib = inputs.crane.mkLib pkgs;
  };
in mapAttrs (n: _: pkgs.callPackage ./${n} extraArgs)
    (filterAttrs (_: v: v == "directory") (readDir ./.))

