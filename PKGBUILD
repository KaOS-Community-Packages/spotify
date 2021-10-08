pkgname=spotify
pkgver=1.1.68.632
_anotherpkgver=g2b11de83
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
url="http://www.spotify.com"
## this is even worse they do _not_ have any license for the
## client sw see:
## https://community.spotify.com/t5/Desktop-Linux-Windows-Web-Player/What-license-does-the-linux-spotify-client-use/td-p/173356/page/2
license=('custom: http://www.spotify.com/us/legal/end-user-agreement/')
options=('!strip')
depends=("alsa-lib" "gtk2" "glib2" "nss" "libxtst" "libx11" "libxss" "curl-kcp" "libcups" "atk" "at-spi2-atk")
source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb"
        'spotify.sh'
        'spotify.protocol')
md5sums=('efd9b29572100f247ee6e2ffbaf54293'
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
    
    # Ugly workaround
    ln -s /usr/lib/libidn2.so ${pkgdir}/usr/share/spotify/libidn2.so.0
}
