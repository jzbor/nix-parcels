{ pkgs, ...}:

let
  inherit ((builtins.fromJSON (builtins.readFile ../../flake.lock)).nodes.typst-packages) locked;
in pkgs.fetchFromGitHub
  {
  owner = "typst";
  repo = "packages";
  inherit (locked) rev;
  sha256 = locked.narHash;
}
