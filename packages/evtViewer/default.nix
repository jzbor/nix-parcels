{ pkgs, ... }:

let
  evtViewer =  pkgs.fetchFromGitHub {
    owner = "martymac";
    repo = "evtViewer";
    rev = "evtViewer-0.6";
    sha256 = "sha256-Ffn3HgIDyhxdDSD3duaVOxXngD4qtb9IeiEUxPvqyEo=";
  };
in pkgs.writeShellApplication {
  name = "evtViewer";
  text = "${pkgs.perl}/bin/perl ${evtViewer}/evtViewer \"$@\"";
}
