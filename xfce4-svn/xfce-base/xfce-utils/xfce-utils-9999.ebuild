# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_core

DESCRIPTION="Collection of utils"
HOMEPAGE="http://www.xfce.org/projects/xfce-utils/"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="dbus debug +lock"

RDEPEND="x11-apps/xrdb
	x11-libs/libX11
	>=dev-libs/glib-2.6:2
	>=x11-libs/gtk+-2.6:2
	>=xfce-base/libxfce4util-4.5.90
	>=xfce-base/libxfcegui4-4.5.90
	>=xfce-base/xfconf-4.5.90
	dbus? ( dev-libs/dbus-glib )
	lock? ( || ( x11-misc/xscreensaver
		gnome-extra/gnome-screensaver
		x11-misc/xlockmore ) )"

XFCE_CONFIG="${XFCE_CONFIG} $(use_enable dbus) --with-vendor-info=Gentoo"

DOCS="AUTHORS ChangeLog NEWS README TODO"

src_install() {
	xfce4_src_install

	insinto /usr/share/xfce4
	doins "${FILESDIR}/Gentoo"
}
