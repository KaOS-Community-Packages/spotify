pkgname=spotify
pkgver=1.0.47.13
_anotherpkgver=gd8e05b1f-47
pkgrel=2
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
license=('custom:"Copyright (c) 2006-2017 Spotify Ltd"')
url="http://www.spotify.com"
options=('!strip')
depends=("alsa-lib" "gconf" "gtk2" "glib2" "nss" "systemd" "libxtst" "libx11" "libxss" "curl-kcp" "cups")
source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb"
        "https://github.com/dasJ/spotifywm/archive/master.zip"
        'spotify'
        'spotify.protocol')
md5sums=('4e76d87b1f24fb122f71b3e91ccf7d96'
         'a14062077e248749fccd3af5d603aa11'
         '5ea1086648bed09c7558c17099bbe76b'
         'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')
build() {
    cd spotifywm-master
    make
}

package() {
<<<<<<< HEAD
    tar -xzf data.tar.gz -C "${pkgdir}"
    rm -r ${pkgdir}/usr/share/doc
    install -dm755 ${pkgdir}/usr/share/applications
    install -dm755 ${pkgdir}/usr/lib/spotify
    install -Dm755 ${srcdir}/spotifywm-master/spotifywm.so "${pkgdir}"/usr/lib/spotify/spotifywm.so
    install "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
=======
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
>>>>>>> refs/remotes/origin/master

    local size
    for size in 22 24 32 48 64 128 256 512; do
        install -D ${pkgdir}/usr/share/spotify/icons/spotify-linux-$size.png \
                ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png
    done
    
    chmod -R go-w ${pkgdir}/usr
    rm ${pkgdir}/usr/bin/spotify
    rm -rf ${pkgdir}/usr/share/spotify/icons
    install -Dm755 ${srcdir}/spotify ${pkgdir}/usr/bin/spotify
    install -Dm644 ${srcdir}/spotify.protocol ${pkgdir}/usr/share/kservices5/spotify.protocol
}