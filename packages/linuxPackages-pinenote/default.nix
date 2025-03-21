{ pkgs, fetchFromGitHub, ... }:

pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_6_12.override {
  argsOverride = rec {
    src = fetchFromGitHub {
      owner = "m-weigand";
      repo = "linux";
      rev = "branch_pinenote_6-12-rc3_v1";
      sha256 = "sha256-kjY63lyWoxeQC75UzoVcjDNrtooK1n8c1ILn9tdz81c=";
    };
    version = "6.12.0-rc3";
    modDirVersion = "6.12.0-rc3";
    configfile = src + /arch/arm64/configs/pinenote_defconfig;  # TODO vendor if it slows eval down too much
  };
})
