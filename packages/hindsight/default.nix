{ lib, pkgs, fetchFromGitHub, ... }:

let
  ccl_simplesnappy = pkgs.python3Packages.buildPythonPackage rec {
    pname = "ccl_simplesnappy";
    version = "unstable";
    format = "setuptools";

    src = fetchFromGitHub {
      owner = "cclgroupltd";
      repo = pname;
      rev = "3d085230baa8c46cf2090ebba29bf6e8eab31087";
      sha256 = "sha256-ssQIZyhrhttqaQjdk/DOiRwqBiKqCf9QiDN2rJ6E7+c=";
    };

    preBuild = ''
      cp ${./ccl_simplesnappy/setup.py} ./setup.py
    '';

    dontCheckRuntimeDeps = true;

    meta = with lib; {
      description = "A pure Python Snappy decompressor with no dependencies.";
      homepage = "https://github.com/cclgroupltd/ccl_simplesnappy";
      license = licenses.mit;
    };
  };
  ccl_chromium_reader = pkgs.python3Packages.buildPythonPackage rec {
    pname = "ccl_chromium_reader";
    version = "unstable";
    format = "setuptools";

    src = fetchFromGitHub {
      owner = "cclgroupltd";
      repo = pname;
      rev = "552516720761397c4d482908b6b8b08130b313a1";
      sha256 = "sha256-W+c4C02RtONxUFnyqWeKZGVss12S7kzg1edp/QrDQnQ=";
    };

    preBuild = ''
      cp ${./ccl_chromium_reader/setup.py} ./setup.py
    '';

    propagatedBuildInputs = with pkgs.python3Packages; [
      brotli
      jinja2
      markupsafe
      pycryptodome
      # pywin32
      ccl_simplesnappy
    ];

    meta = with lib; {
      description = "(Sometimes partial) Python re-implementations of the technologies involved in reading various data sources in Chrome-esque applications.";
      homepage = "https://github.com/cclgroupltd/ccl_chromium_reader";
      license = licenses.mit;
    };
  };
in pkgs.python3Packages.buildPythonApplication rec {
  pname = "hindsight";
  version = "2026.04";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "RyanDFIR";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-6rN7wtcKaE2wwkvEyWK/UHaoLvjftNlBgZryIxYOCM8=";
  };

  propagatedBuildInputs = with pkgs.python3Packages; [
    bottle
    keyring
    protobuf
    puremagic
    pycryptodome
    pycryptodomex
    tzdata
    xlsxwriter
    rich
    ccl_chromium_reader
  ];

  meta = with lib; {
    description = "Browser forensics tool for Google Chrome (and other Chromium-based browsers)";
    homepage = "https://github.com/RyanDFIR/hindsight/";
    license = licenses.asl20;
  };
}
