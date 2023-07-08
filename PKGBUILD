pkgname=spotify
pkgver=1.2.13.661
_anotherpkgver=ga588f749
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
url="http://www.spotify.com"
license=('custom: http://www.spotify.com/us/legal/end-user-agreement/')
options=('!strip')
depends=("alsa-lib" "gtk2" "glib2" "nss" "libxtst" "libx11" "libxss" "curl-kcp" "libcups" "at-spi2-core")
source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb"
        'spotify.sh'
        'spotify.protocol')
md5sums=('d9e3ccfdb473fabdf88843d5be9fab93'
         '6f455892f05a20c3f34089f7c20dfb97'
         'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')

package() {
    tar -xzf data.tar.gz -C ${pkgdir}
    rm -r ${pkgdir}/usr/share/doc
    install -dm755 ${pkgdir}/usr/share/applications
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
}
