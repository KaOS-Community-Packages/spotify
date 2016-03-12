pkgname=spotify
pkgver=1.0.25.127
_anotherpkgver=g58007b4c-22
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
md5sums=('fcf478a17e580587094d1d7681af60b4'
         '4b70593f14adb66d4aa4803124503376'
         'ef25ddc5b6bf8fe1a0d64cbd79e1f7b4')


package() {
  cd "${srcdir}"

	tar -xzf data.tar.gz -C "${pkgdir}"

	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/share/pixmaps
	install "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
	install "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

	# Bin Script
	rm "${pkgdir}"/usr/bin/spotify
	install -Dm755 "${srcdir}/spotify" "${pkgdir}/usr/bin/spotify"

  # Copy protocol file if KDE is installed
  if [ -f /usr/bin/startkde ]; then
    echo "Installing with KDE support"
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kde4/services/spotify.protocol"
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"
  fi
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
