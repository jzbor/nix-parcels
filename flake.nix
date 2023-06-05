{
  description = "jzbor's personal overlay";
  inputs = {
    nixpkgs.url = "nixpkgs";
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
    overlays.default = import ./default.nix;

    overlays = {
      adi1090x-plymouth = import ./overlays/adi1090x-plymouth;
      buttermilk = import ./overlays/buttermilk;
      chordpro = import ./overlays/chordpro;
      foliot = import ./overlays/foliot;
      marswm = import ./overlays/marswm;
      nextcloud-client = import ./overlays/nextcloud-client;
      pademelon = import ./overlays/pademelon;
    };
  };
}
