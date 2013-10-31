# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfce4-appfinder/xfce4-appfinder-4.10.1.ebuild,v 1.1 2013/05/05 16:26:55 ssuominen Exp $

EAPI=5
inherit xfconf

DESCRIPTION="A tool to find and launch installed applications for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug gtk3"

RDEPEND=">=dev-libs/dbus-glib-0.100
	>=dev-libs/glib-2.28
	>=xfce-base/garcon-0.2
	>=xfce-base/libxfce4util-4.10
	>=xfce-base/libxfce4ui-4.10[gtk3?]
	>=xfce-base/xfconf-4.10
	gtk3? ( >=x11-libs/gtk+-3.2:3 )
	!gtk3? ( >=x11-libs/gtk+-2.20:2 )
	!xfce-base/xfce-utils"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	XFCONF=(
		$(xfconf_use_debug)
		$(use_enable gtk3)
		)

	DOCS=( AUTHORS ChangeLog NEWS )
}
