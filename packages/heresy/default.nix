{ inputs, pkgs,  ... }:

(import inputs.heretic-lisp {
  inherit pkgs;
  system = pkgs.system;
}).packages.default
