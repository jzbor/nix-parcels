{
  description = "jzbor's personal overlay";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-chordpro.url = "github:nixos/nixpkgs/658e7223191d2598641d50ee4e898126768fe847";

    cf.url = "github:jzbor/cornflakes";
    crane.url = "github:ipetkov/crane";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    ### Imported Packages ###
    lash = {
      url = "github:jzbor/lash";
      inputs = {
        cf.follows = "cf";
        crane.follows = "crane";
        nixpkgs.follows = "nixpkgs";
      };
    };

    marswm = {
      url = "github:jzbor/marswm";
      inputs = {
        cf.follows = "cf";
        crane.follows = "crane";
        nixpkgs.follows = "nixpkgs";
      };
    };

    typst-packages = {
      url = "github:typst/packages";
      flake = false;
    };
  };


  outputs = { self, nixpkgs, cf, ... }:
  let
    libcf = cf.mkLib nixpkgs;
  in (libcf.flakeForDefaultSystems (system: {
    packages = import ./packages self.inputs (libcf.mkPkgs nixpkgs system);
    legacyPackages = import ./packages/legacy.nix self.inputs (libcf.mkPkgs nixpkgs system);
  })) // {
    overlays.default = import ./overlay.nix self.inputs;
  };
}
