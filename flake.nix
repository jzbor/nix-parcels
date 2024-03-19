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
      everforest-gtk-theme = import ./overlays/everforest-gtk-theme;
      foliot = import ./overlays/foliot;
      goatcounter = import ./overlays/goatcounter;
      kanagawa-gtk-theme = import ./overlays/kanagawa-gtk-theme;
      lisho = import ./overlays/lisho;
      nextcloud-client = import ./overlays/nextcloud-client;
      pademelon = import ./overlays/pademelon;
      raw-to-img = import ./overlays/raw-to-img;
      obligator = import ./overlays/obligator;
    };
  };
}
