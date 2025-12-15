{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  makeWrapper,
  copyDesktopItems,
  makeDesktopItem,
  ncurses,
  libtermkey,
  lua,
  tre,
  acl,
  libselinux,
  ...
}:

let
  luaEnv = lua.withPackages (ps: [ ps.lpeg ]);
in
stdenv.mkDerivation rec {
  pname = "vis";
  version = "unstable-2025-12-14";

  src = fetchFromGitHub {
    rev = "992804cb27993d5de8e6830a8ab9268045ce6892";
    hash = "sha256-B6VWEAxl1sqYBd2myyywfUTkdgdaWpeF9PS1lazY3+c=";
    repo = "vis";
    owner = "martanne";
  };

  nativeBuildInputs = [
    pkg-config
    makeWrapper
    copyDesktopItems
  ];

  buildInputs = [
    ncurses
    libtermkey
    luaEnv
    tre
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [
    acl
    libselinux
  ];

  postInstall = ''
    wrapProgram $out/bin/vis \
      --prefix LUA_CPATH ';' "${luaEnv}/lib/lua/${lua.luaversion}/?.so" \
      --prefix LUA_PATH ';' "${luaEnv}/share/lua/${lua.luaversion}/?.lua" \
      --prefix VIS_PATH : "\$HOME/.config:$out/share/vis"
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "vis";
      exec = "vis %U";
      type = "Application";
      icon = "accessories-text-editor";
      comment = meta.description;
      desktopName = "vis";
      genericName = "Text editor";
      categories = [
        "Application"
        "Development"
        "IDE"
      ];
      mimeTypes = [
        "text/plain"
        "application/octet-stream"
      ];
      startupNotify = false;
      terminal = true;
    })
  ];

  meta = with lib; {
    description = "A vim like editor";
    homepage = "https://github.com/martanne/vis";
    license = licenses.isc;
    maintainers = with maintainers; [ ramkromberg ];
    platforms = platforms.unix;
  };
}
