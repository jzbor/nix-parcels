{ symlinkJoin, pkgs, ... }:

symlinkJoin {
  name = "vlc-dvd";
  pname = "vlc";
  inherit (pkgs.vlc) version;

  paths = with pkgs; [
    vlc
    libdvdcss
    libdvdnav
    libdvdread
  ];

  meta = {
    description = "A meta package for VLC with DVD support";
    inherit (pkgs.vlc.meta) homepage;
  };
}

