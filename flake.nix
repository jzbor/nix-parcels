{
  description = "jzbor's personal overlay";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    let
      flakePackages = system: import nixpkgs {
        overlays = [ (import ./default.nix) ];
        inherit system;
      };
    in utils.lib.eachDefaultSystem (system: rec {
      legacyPackages = flakePackages system;
      packages = utils.lib.flattenTree {
        inherit legacyPackages;
      };
  }) // {
    # Default overlay
    overlay = import ./default.nix;
  };
}
