{ lib, pkgs, craneLib, fetchFromGitHub, ... }:

craneLib.buildPackage rec {
  pname = "pinenote_dbus_service";
  version = "0.2.2-dev5";

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    dbus
  ];

  src = craneLib.cleanCargoSource (fetchFromGitHub {
    owner = "pndeb";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-+zDeAJ7QQT3UbuJC+njKtIpRYe7AeFI60wnYPE5+NN4=";
  });

  meta = with lib; {
    description = "A dbus daemon for controlling some driver aspects related to the Pine64 Pinenote";
    homepage = "https://github.com/pndeb/pinenote_dbus_service";
    license = licenses.mit;
  };
}
