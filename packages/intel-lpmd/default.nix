{ pkgs, lib, stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation rec {
  pname = "intel-lpmd";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "intel";
    repo = pname;
    rev = "v" + version;
    sha256 = "sha256-eZBgWpR2tdSDeqYV4Y2h2j5UeJebQg2tXlXcUywwZEA=";
  };

  meta = with lib; {
    description = "Intel Low Power Mode Daemon (lpmd) is a Linux daemon designed to optimize active idle power.";
    homepage = "https://github.com/intel/intel-lpmd";
    license = licenses.gpl2;
  };

  nativeBuildInputs = with pkgs; [
    pkg-config
    autoconf
    autoreconfHook
    automake
    gtk-doc
  ];

  buildInputs = with pkgs; [
    glib
    dbus
    libxml2
    systemdLibs
    upower
    libnl
    man-db
  ];

  patchPhase = ''
    sed -i '30,34d' data/Makefile.am
  '';

  configureFlags = [
    "--with-dbus-sys-dir=$out/share/dbus-1/system-services/"
    "--without-systemdsystemunitdir"
    "--localstatedir=/var"
    "--sysconfdir=/etc"
  ];

  postInstall = ''
    mkdir -p $out/share/dbus-1/system-services/
    cp -v data/org.freedesktop.intel_lpmd.conf $out/share/dbus-1/system-services/
  '';
}
