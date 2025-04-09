{ pkgs, fetchFromGitHub, ... }:

pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_6_12.override {
  argsOverride = rec {
    src = fetchFromGitHub {
      owner = "m-weigand";
      repo = "linux";
      rev = "branch_pinenote_6-12-11";
      sha256 = "sha256-jbx+BWUo2dNYMrUulqhiO9efkLPhJUs5XjvWooMSxJw=";
    };
    version = "6.12.11";
    modDirVersion = "6.12.11";
    configfile = src + /arch/arm64/configs/pinenote_defconfig;  # TODO vendor if it slows eval down too much
    structuredExtraConfig = with pkgs.lib.kernel; {
      CRYPTO_AEGIS128_SIMD = no;
    };
  };
})

# pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_6_12.override {
#   argsOverride = {
#     src = fetchFromGitHub {
#       owner = "m-weigand";
#       repo = "linux";
#       rev = "branch_pinenote_6-12-11";
#       sha256 = "sha256-jbx+BWUo2dNYMrUulqhiO9efkLPhJUs5XjvWooMSxJw=";
#     };
#     version = "6.12.11";
#     modDirVersion = "6.12.11";
#     defconfig = "pinenote_defconfig";
#     ignoreConfigErrors = true;
#   };
# })



# pkgs.linuxPackages_custom rec {
#     src = fetchFromGitHub {
#       owner = "m-weigand";
#       repo = "linux";
#       rev = "branch_pinenote_6-12-11";
#       sha256 = "sha256-jbx+BWUo2dNYMrUulqhiO9efkLPhJUs5XjvWooMSxJw=";
#     };
#     version = "6.12.11";
#     configfile = src + /arch/arm64/configs/pinenote_defconfig;  # TODO vendor if it slows eval down too much
#     extraConfig = ''
#       # See comments on https://github.com/NixOS/nixpkgs/commit/9b67ea9106102d882f53d62890468071900b9647
#       CRYPTO_AEGIS128_SIMD = no;
#     '';
# }
