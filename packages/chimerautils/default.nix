{ pkgs, lib, ... }:

pkgs.clangStdenv.mkDerivation rec {
  pname = "chimerautils";
  version = "15.0.2";

  src = pkgs.fetchFromGitHub {
    owner = "chimera-linux";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-zDPCCcit6LYpvNxWTtQuJE5Euo44sDnSR+ODWHD4GEo=";
  };

  patches = [ ./patch-1.diff ];

  meta = with lib; {
    description = "Chimera's core userland, based on FreeBSD";
    homepage = "https://github.com/chimera-linux/chimerautils";
    license = licenses.bsd2;
  };

  nativeBuildInputs = with pkgs; [
    meson
    ninja
    cmake
    pkg-config
  ];

  buildInputs = with pkgs; [
    acl
    byacc
    bzip2
    flex
    libedit
    libselinux
    libxo
    ncurses
    openssl
    xz
    zlib
    zstd
  ];

  mesonBuildType = "release";
  mesonFlags = ["-Db_lundef=true"];
}
