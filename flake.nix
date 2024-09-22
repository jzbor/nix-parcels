{
  description = "jzbor's personal overlay";
  inputs = {
    nixpkgs.url = "nixpkgs";
    cf.url = "github:jzbor/cornflakes";
    crane.url = "github:ipetkov/crane";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, cf, ... }:
  let
    libcf = cf.mkLib nixpkgs;
  in (libcf.flakeForDefaultSystems (system: {
    packages = import ./packages self.inputs (libcf.mkPkgs system);
  })) // {
    overlays.default = import ./overlay.nix self.inputs;
  };
}
