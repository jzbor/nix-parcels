{ inputs, pkgs,  ... }:

(import inputs.heretic-lisp {
  inherit pkgs;
  inherit (pkgs) system;
}).packages.default
