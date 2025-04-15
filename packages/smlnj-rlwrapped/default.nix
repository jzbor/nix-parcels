{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "sml";
  text = "${pkgs.rlwrap}/bin/rlwrap ${pkgs.smlnj}/bin/sml";
  inherit (pkgs.rlwrap) meta;
}
