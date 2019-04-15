{ stdenv, fetchurl, qtbase, qtsvg, qmake, pkgconfig, boost, wirelesstools, iw, qwt, makeWrapper }:

stdenv.mkDerivation rec {
  name = "linssid-${version}";
  version = "2.7";

  src = fetchurl {
    url = "mirror://sourceforge/project/linssid/LinSSID_${version}/linssid_${version}.orig.tar.gz";
    sha256 = "13d35rlcjncd8lx3khkgn9x8is2xjd5fp6ns5xsn3w6l4xj9b4gl";
  };

  nativeBuildInputs = [ pkgconfig qmake makeWrapper ];
  buildInputs = [ qtbase qtsvg boost qwt ];

  patches = [ ./0001-unbundled-qwt.patch ];

  postPatch = ''
    sed -e "s|/usr/include/qt5.*$|& ${qwt}/include|" -i linssid-app/linssid-app.pro
    sed -e "s|/usr/include/|/nonexistent/|g" -i linssid-app/*.pro
    sed -e 's|^LIBS .*= .*libboost_regex.a|LIBS += -lboost_regex|' \
        -e "s|/usr|$out|g" \
        -i linssid-app/linssid-app.pro linssid-app/linssid.desktop
    sed -e "s|\.\./\.\./\.\./\.\./usr|$out|g" -i linssid-app/*.ui

    # Remove bundled qwt
    rm -fr qwt-lib
  '';

  postInstall = ''
    wrapProgram $out/bin/linssid \
      --prefix QT_PLUGIN_PATH : ${qtbase}/${qtbase.qtPluginPrefix} \
      --prefix PATH : ${stdenv.lib.makeBinPath [ wirelesstools iw ]}  
      '';

  meta = with stdenv.lib; {
    description = "Graphical wireless scanning for Linux";
    homepage = https://sourceforge.net/projects/linssid/;
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [ maintainers.bjornfor ];
  };
}