inputs: pkgs:
let
  extraArgs = {
    craneLib = inputs.crane.mkLib pkgs;
    craneLibStatic = (inputs.crane.mkLib (pkgs.extend inputs.rust-overlay.overlays.default)).overrideToolchain (p: p.rust-bin.stable.latest.default.override {
      targets = [ "x86_64-unknown-linux-musl" ];
    });
  };
in {
  adi1090x-plymouth = pkgs.callPackage ./adi1090x-plymouth {};
  buttermilk = pkgs.callPackage ./buttermilk {};
  chordpro = pkgs.callPackage ./chordpro {};
  cliflux = pkgs.callPackage ./cliflux {};
  decap_oauth = pkgs.callPackage ./decap_oauth {};
  erth-exporter = pkgs.callPackage ./erth-exporter {};
  everforest-gtk-theme = pkgs.callPackage ./everforest-gtk-theme {};
  foliot = pkgs.callPackage ./foliot {};
  goatcounter = pkgs.callPackage ./goatcounter {};
  kanagawa-gtk-theme = pkgs.callPackage ./kanagawa-gtk-theme {};
  lisho = pkgs.callPackage ./lisho {};
  obligator = pkgs.callPackage ./obligator {};
  pademelon = pkgs.callPackage ./pademelon {};
  rapl-read = pkgs.callPackage ./rapl-read {};
  raw-to-img = pkgs.callPackage ./raw-to-img {};
  statix-static = pkgs.callPackage ./statix-static extraArgs;
}

