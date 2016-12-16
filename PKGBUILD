pkgname=spotify
pkgver=1.0.45.182
_anotherpkgver=gbbd5909f-72
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
url="http://www.spotify.com"
options=('!strip')
depends=("alsa-lib" "gconf" "gtk2" "glib2" "nss" "systemd" "libxtst" "libx11" "libxss" "libcurl-compat")
source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb"
        "spotify.protocol")
md5sums=('0deae5600c42fda7877ae6094b060279'
         'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')


package() {
	tar -xzf data.tar.gz -C "${pkgdir}"
    rm -r ${pkgdir}/usr/share/doc
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/pixmaps
	install "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
	install "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png
    rm "${pkgdir}"/usr/bin/spotify
	echo -en '#!/bin/sh\nLD_PRELOAD=libcurl.so.3 /usr/share/spotify/spotify "$@"' > ${pkgdir}/usr/bin/spotify
    chmod +x ${pkgdir}/usr/bin/spotify
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

