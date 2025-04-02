inputs: pkgs:

let
  inherit (pkgs) system;
  extraArgs = {
    inherit inputs;
    craneLib = inputs.crane.mkLib pkgs;
  };
in {
  adi1090x-plymouth = pkgs.callPackage ./adi1090x-plymouth extraArgs;
  aoc-cli = pkgs.callPackage ./aoc-cli extraArgs;
  buttermilk = pkgs.callPackage ./buttermilk extraArgs;
  chordpro = pkgs.callPackage ./chordpro extraArgs;
  cliflux = pkgs.callPackage ./cliflux extraArgs;
  decap_oauth = pkgs.callPackage ./decap_oauth extraArgs;
  erth-exporter = pkgs.callPackage ./erth-exporter extraArgs;
  everforest-gtk-theme = pkgs.callPackage ./everforest-gtk-theme extraArgs;
  foliot = pkgs.callPackage ./foliot extraArgs;
  gama = pkgs.callPackage ./gama extraArgs;
  goatcounter = pkgs.callPackage ./goatcounter extraArgs;
  groffX11 = pkgs.callPackage ./groffX11 extraArgs;
  kanagawa-gtk-theme = pkgs.callPackage ./kanagawa-gtk-theme extraArgs;
  lash = inputs.lash.packages.${system}.default;
  lisho = pkgs.callPackage ./lisho extraArgs;
  marswm = inputs.marswm.packages.${system}.default;
  inherit (inputs.marswm.packages.${system}) marswm-scripts;
  millet = pkgs.callPackage ./millet extraArgs;
  neonmodem = pkgs.callPackage ./neonmodem extraArgs;
  nix-sweep = pkgs.callPackage ./nix-sweep extraArgs;
  nixpkgs-tracker = pkgs.callPackage ./nixpkgs-tracker extraArgs;
  obligator = pkgs.callPackage ./obligator extraArgs;
  pademelon = pkgs.callPackage ./pademelon extraArgs;
  peanutbutter = pkgs.callPackage ./peanutbutter extraArgs;
  pinenote_dbus_service = pkgs.callPackage ./pinenote_dbus_service extraArgs;
  rapl-read = pkgs.callPackage ./rapl-read extraArgs;
  raw-to-img = pkgs.callPackage ./raw-to-img extraArgs;
  typstPackagesAll = pkgs.callPackage ./typst-packages extraArgs;  # see also typstPackages output
  typstPackagesSrc = pkgs.callPackage ./typst-packages/source.nix extraArgs;  # extra package for use in update-packages.sh
  vlc-dvd = pkgs.callPackage ./vlc-dvd extraArgs;
  zizmor = pkgs.callPackage ./zizmor extraArgs;
}

