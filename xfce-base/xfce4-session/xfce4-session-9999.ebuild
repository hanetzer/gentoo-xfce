# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfce4-session/xfce4-session-4.8.1.ebuild,v 1.9 2011/05/19 21:59:42 ssuominen Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Xfce's session manager"
HOMEPAGE="http://www.xfce.org/projects/xfce4-session/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="consolekit debug gnome-keyring policykit udev +xfce_plugins_logout"

COMMON_DEPEND=">=dev-libs/dbus-glib-0.88
	sys-apps/dbus
	x11-apps/iceauth
	>=x11-libs/gtk+-2.14:2
	x11-libs/libSM
	>=x11-libs/libwnck-2.22:1
	x11-libs/libX11
	>=xfce-base/libxfce4util-4.8
	>=xfce-base/libxfce4ui-4.8
	>=xfce-base/xfconf-4.8
	>=xfce-base/xfce-utils-4.8
	gnome-keyring? ( gnome-base/libgnome-keyring )
	xfce_plugins_logout? ( >=xfce-base/xfce4-panel-4.8 )"
RDEPEND="${COMMON_DEPEND}
	consolekit? ( sys-auth/consolekit )
	policykit? ( sys-auth/polkit )
	udev? ( sys-power/upower )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext
	xfce-base/exo"

pkg_setup() {
	XFCONF=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		--disable-static
		$(use_enable xfce_plugins_logout panel-plugin)
		$(use_enable gnome-keyring libgnome-keyring)
		$(xfconf_use_debug)
		--disable-hal
		$(use_enable udev upower)
		$(use_enable consolekit)
		$(use_enable policykit polkit)
		)

	DOCS=( AUTHORS BUGS ChangeLog NEWS README TODO )
}
