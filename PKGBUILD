pkgname=spotify
pkgver=1.0.98.78
_anotherpkgver=gb45d2a6b-10
pkgrel=3
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
url="http://www.spotify.com"
## this is even worse they do _not_ have any license for the
## client sw see:
## https://community.spotify.com/t5/Desktop-Linux-Windows-Web-Player/What-license-does-the-linux-spotify-client-use/td-p/173356/page/2
license=('custom: http://www.spotify.com/us/legal/end-user-agreement/')
options=('!strip')
depends=("alsa-lib" "gconf" "gtk2" "glib2" "nss" "libxtst" "libx11" "libxss" "curl-kcp" "libcups")
source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb"
        "https://github.com/dasJ/spotifywm/archive/master.zip"
        'spotify.sh'
        'spotify.protocol')
md5sums=('84fdcff7fb4fccff08c5ec69a45d70b2'
         'a14062077e248749fccd3af5d603aa11'
         'd6771f7514bda891269c915ec44b127f'
         'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')

build() {
    cd spotifywm-master
    make
}

package() {
    tar -xzf data.tar.gz -C ${pkgdir}
    rm -r ${pkgdir}/usr/share/doc
    install -dm755 ${pkgdir}/usr/share/applications
    install -Dm755 ${srcdir}/spotifywm-master/spotifywm.so ${pkgdir}/usr/share/spotify/spotifywm.so
    install -Dm644 ${pkgdir}/usr/share/spotify/spotify.desktop ${pkgdir}/usr/share/applications/spotify.desktop

    local size
    for size in 22 24 32 48 64 128 256 512; do
        install -D ${pkgdir}/usr/share/spotify/icons/spotify-linux-$size.png \
                ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png
    done

    chmod -R go-w ${pkgdir}/usr
    rm ${pkgdir}/usr/bin/spotify
    rm -rf ${pkgdir}/usr/share/spotify/icons
    install -Dm755 ${srcdir}/spotify.sh ${pkgdir}/usr/bin/spotify
    install -Dm644 ${srcdir}/spotify.protocol ${pkgdir}/usr/share/kservices5/spotify.protocol
    
    # Ugly workaround
    ln -s /usr/lib/libidn2.so ${pkgdir}/usr/share/spotify/libidn2.so.0
}
