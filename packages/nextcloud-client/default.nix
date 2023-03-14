{ lib, fetchFromGitHub, pkgs, ... }:

super.nextcloud-client.overrideAttrs ( old: rec {
  version = "3.7.3";
  src = fetchFromGitHub {
    owner = "nextcloud";
    repo = "desktop";
    rev = "v${version}";
    sha256 = "sha256-K9P9avZdW+aR+K+GSp4kqWVZX5J7mHpu4gyuR4smmcU=";
  };
});
