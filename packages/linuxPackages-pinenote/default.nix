{ pkgs, fetchFromGitHub, ... }:

# pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_6_12.override {
#   argsOverride = rec {
#     src = fetchFromGitHub {
#       owner = "m-weigand";
#       repo = "linux";
#       rev = "branch_pinenote_6-12-11";
#       sha256 = "sha256-jbx+BWUo2dNYMrUulqhiO9efkLPhJUs5XjvWooMSxJw=";
#     };
#     version = "6.12.11";
#     modDirVersion = "6.12.11";
#     configfile = src + /arch/arm64/configs/pinenote_defconfig;  # TODO vendor if it slows eval down too much
#   };
# })

pkgs.linuxPackages_custom rec {
    src = fetchFromGitHub {
      owner = "m-weigand";
      repo = "linux";
      rev = "branch_pinenote_6-12-11";
      sha256 = "sha256-jbx+BWUo2dNYMrUulqhiO9efkLPhJUs5XjvWooMSxJw=";
    };
    version = "6.12.11";
    configfile = src + /arch/arm64/configs/pinenote_defconfig;  # TODO vendor if it slows eval down too much
}
