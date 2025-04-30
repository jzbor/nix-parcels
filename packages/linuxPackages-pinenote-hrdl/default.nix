{ pkgs, fetchFromSourcehut, ... }:

pkgs.buildLinux rec {
    src = fetchFromSourcehut {
      owner = "~hrdl";
      repo = "linux";
      rev = "482a48c60427e66e57f9f4ddd45ea01091f66ee1";
      sha256 = "sha256-C3kbrNSf/VJ2L66G1HlGdVpvD6UKK76ztCUmsgrKdIU=";
    };
    version = "6.15.0-rc3";
    modDirVersion = version;
    defconfig = "pinenote_defconfig";
    # extraConfig = ''
    #   # See comments on https://github.com/NixOS/nixpkgs/commit/9b67ea9106102d882f53d62890468071900b9647
    #   CRYPTO_AEGIS128_SIMD = no;
    # '';
}
