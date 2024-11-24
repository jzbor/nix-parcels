{ pkgs, fetchFromGitHub, ... }:

pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_6_12.override {
  argsOverride = rec {
    src = fetchFromGitHub {
      owner = "m-weigand";
      repo = "linux";
      rev = "branch_pinenote_6-12_v1";
      sha256 = "sha256-wiYKBqH3bWswxsdyVF9nXQ3hwXUuxDdKMUORTVZrDc0=";
    };
    version = "6.12.0";
    modDirVersion = "6.12.0";
    config = builtins.readFile "${src}/arch/arm64/configs/pinenote_defconfig";
  };
})
