# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfce4-appfinder/xfce4-appfinder-4.12.0.ebuild,v 1.1 2015/03/08 15:06:39 mgorny Exp $

EAPI=5
inherit xfconf

DESCRIPTION="A tool to find and launch installed applications for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=dev-libs/dbus-glib-0.100
	>=dev-libs/glib-2.30
	>=x11-libs/gtk+-3.2:3
	>=xfce-base/garcon-0.3
	>=xfce-base/libxfce4util-4.11
	>=xfce-base/libxfce4ui-4.11
	>=xfce-base/xfconf-4.10
	!xfce-base/xfce-utils"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	XFCONF=(
		--enable-gtk3
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog NEWS )
}
