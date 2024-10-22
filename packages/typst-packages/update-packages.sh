#!/bin/sh

(echo "["; ls -1 $(nix build --no-link --print-out-paths .\#typstPackagesSrc)/packages/preview | sed 's/\(.*\)/  "\1"/'; echo "]") | tee package_names.nix
