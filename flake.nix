{
  description = "jzbor's personal overlay";
  inputs.nixpkgs.url = "nixpkgs";
  inputs.cf.url = "github:jzbor/cornflakes";

  outputs = { nixpkgs, cf, ... }:
  let
    libcf = cf.mkLib nixpkgs;
  in (libcf.flakeForDefaultSystems (system: {
    packages = import ./packages (libcf.mkPkgs system);
  })) // {
    overlays.default = import ./overlay.nix;
  };
}
