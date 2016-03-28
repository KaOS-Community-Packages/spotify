pkgname=spotify
pkgver=1.0.26.125
_anotherpkgver=g64dc8bc6-14
pkgrel=1
pkgdesc="A proprietary music streaming service"
arch=('x86_64')
license=('custom:"Copyright (c) 2006-2010 Spotify Ltd"')
url="http://www.spotify.com"
options=('!strip')
depends=("alsa-lib>=1.0.14" "gconf" "gtk2" "glib2" "nss" "systemd" "libxtst" "libx11" "libxss" "libcurl-compat")
source=("http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_anotherpkgver}_amd64.deb"
        "spotify"
        "spotify.protocol")
md5sums=('78cb52afe74d3f9fa4f8e1edbb0f8082'
         '4b70593f14adb66d4aa4803124503376'
         'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')


package() {
  cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"

	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/pixmaps
	install "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
	install "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

	rm "${pkgdir}"/usr/bin/spotify
	install -Dm755 "${srcdir}/spotify" "${pkgdir}/usr/bin/spotify"

  install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"

  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
