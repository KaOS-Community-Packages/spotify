pkgname=spotify
pkgver=1.0.57.474
_anotherpkgver=gca9c9538-30
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
url="http://www.spotify.com"
## this is even worse they do _not_ have any license for the
## client sw see:
## https://community.spotify.com/t5/Desktop-Linux-Windows-Web-Player/What-license-does-the-linux-spotify-client-use/td-p/173356/page/2
license=('custom: http://www.spotify.com/us/legal/end-user-agreement/')
options=('!strip')
depends=("alsa-lib" "gconf" "gtk2" "glib2" "nss" "systemd" "libxtst" "libx11" "libxss" "curl-kcp" "cups")
source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb"
        "https://github.com/dasJ/spotifywm/archive/master.zip"
        'spotify'
        'spotify.protocol')
md5sums=('18775750a2ad8837319b71ed26ed196a'
         'a14062077e248749fccd3af5d603aa11'
         '2fd3bb269b12082eb6b1c5c64c240332'
         'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')

build() {
    cd spotifywm-master
    make
}

package() {
    tar -xzf data.tar.gz -C ${pkgdir}
    rm -r ${pkgdir}/usr/share/doc
    install -dm755 ${pkgdir}/usr/share/applications
    install -dm755 ${pkgdir}/usr/lib/spotify
    install -Dm755 ${srcdir}/spotifywm-master/spotifywm.so ${pkgdir}/usr/lib/spotify/spotifywm.so
    install -Dm644 ${pkgdir}/usr/share/spotify/spotify.desktop ${pkgdir}/usr/share/applications/spotify.desktop

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
