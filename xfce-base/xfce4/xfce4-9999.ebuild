# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

XFCE_VERSION=${PV}

HOMEPAGE="http://www.xfce.org"
DESCRIPTION="Meta package for Xfce4 desktop, merge this package to install."
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="alsa cups minimal oss xscreensaver"

RDEPEND="~x11-themes/gtk-engines-xfce-9999
	~x11-themes/xfce4-icon-theme-9999
	~xfce-base/thunar-9999
	~xfce-base/xfce4-panel-9999
	~xfce-base/xfwm4-9999
	~xfce-base/xfce-utils-9999
	~xfce-base/xfdesktop-9999
	~xfce-base/xfce4-session-9999
	~xfce-base/xfce4-settings-9999
	alsa? ( ~xfce-extra/xfce4-mixer-9999 )
	oss? ( ~xfce-extra/xfce4-mixer-9999 )
	cups? ( ~net-print/xfprint-9999 )
	!minimal? ( ~app-office/orage-9999
		~app-editors/mousepad-9999
		~x11-terms/terminal-9999
		~x11-themes/xfwm4-themes-9999
		~xfce-extra/xfce4-appfinder-9999 )
	xscreensaver? ( || ( >=x11-misc/xscreensaver-5.03
		gnome-extra/gnome-screensaver ) )"
DEPEND="${RDEPEND}"

src_install() {
	dodir /etc/X11/Sessions
	echo startxfce4 > "${D}/etc/X11/Sessions/Xfce4"
	fperms 755 /etc/X11/Sessions/Xfce4
}

pkg_postinst() {
	elog
	elog "Run Xfce4 from your favourite Display Manager by using"
	elog "XSESSION=\"Xfce4\" in /etc/rc.conf"
	elog
}
