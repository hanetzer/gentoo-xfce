# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfce4-session/xfce4-session-4.11.0.ebuild,v 1.2 2014/03/15 19:30:21 ssuominen Exp $

EAPI=5
inherit xfconf

DESCRIPTION="A session manager for the Xfce desktop environment"
HOMEPAGE="http://docs.xfce.org/xfce/xfce4-session/start"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug nls systemd udev +xscreensaver"

COMMON_DEPEND=">=dev-libs/dbus-glib-0.100
	x11-apps/iceauth
	x11-libs/libSM
	>=x11-libs/libwnck-2.30:1
	x11-libs/libX11
	>=xfce-base/libxfce4util-4.11
	>=xfce-base/libxfce4ui-4.11
	>=xfce-base/xfconf-4.10
	!xfce-base/xfce-utils
	systemd? ( >=sys-auth/polkit-0.100 )"
RDEPEND="${COMMON_DEPEND}
	x11-apps/xrdb
	nls? ( x11-misc/xdg-user-dirs )
	udev? ( >=sys-power/upower-0.9.20 )
	xscreensaver? ( || (
		>=x11-misc/xscreensaver-5.26
		gnome-extra/gnome-screensaver
		>=x11-misc/xlockmore-5.43
		x11-misc/slock
		) )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	XFCONF=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		$(use_enable systemd)
		--with-xsession-prefix="${EPREFIX}"/usr
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS BUGS ChangeLog NEWS README TODO )
}

src_install() {
	xfconf_src_install

	local sessiondir=/etc/X11/Sessions
	echo startxfce4 > "${T}"/Xfce4
	exeinto ${sessiondir}
	doexe "${T}"/Xfce4
	dosym Xfce4 ${sessiondir}/Xfce
}
