# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfce4-session/xfce4-session-4.9.0.ebuild,v 1.1 2012/03/31 05:49:28 ssuominen Exp $

EAPI=4
inherit xfconf

DESCRIPTION="A session manager for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="consolekit debug gnome-keyring udev"

COMMON_DEPEND=">=dev-libs/dbus-glib-0.98
	x11-apps/iceauth
	x11-libs/libSM
	>=x11-libs/libwnck-2.22:1
	x11-libs/libX11
	>=xfce-base/libxfce4util-4.9
	>=xfce-base/libxfce4ui-4.9
	>=xfce-base/xfconf-4.9
	gnome-keyring? ( >=gnome-base/libgnome-keyring-2.22 )
	!xfce-base/xfce-utils"
RDEPEND="${COMMON_DEPEND}
	consolekit? ( || ( sys-auth/consolekit sys-apps/systemd ) )
	udev? ( sys-power/upower )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		$(use_enable gnome-keyring libgnome-keyring)
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS BUGS ChangeLog NEWS README TODO )
}
