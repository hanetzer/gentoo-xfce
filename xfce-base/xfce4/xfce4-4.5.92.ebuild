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

RDEPEND=">=x11-themes/gtk-engines-xfce-2.5.92
	x11-themes/xfce4-icon-theme
	>=xfce-base/thunar-0.9.92
	>=xfce-base/xfce4-panel-${XFCE_VERSION}
	>=xfce-base/xfwm4-${XFCE_VERSION}
	>=xfce-base/xfce-utils-${XFCE_VERSION}
	>=xfce-base/xfdesktop-${XFCE_VERSION}
	>=xfce-base/xfce4-session-${XFCE_VERSION}
	>=xfce-base/xfce4-settings-${XFCE_VERSION}
	alsa? ( >=xfce-extra/xfce4-mixer-${XFCE_VERSION} )
	oss? ( >=xfce-extra/xfce4-mixer-${XFCE_VERSION} )
	cups? ( >=net-print/xfprint-${XFCE_VERSION} )
	!minimal? ( >=app-office/orage-${XFCE_VERSION}
		app-editors/mousepad
		x11-terms/terminal
		>=x11-themes/xfwm4-themes-${XFCE_VERSION}
		>=xfce-extra/xfce4-appfinder-${XFCE_VERSION} )
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
