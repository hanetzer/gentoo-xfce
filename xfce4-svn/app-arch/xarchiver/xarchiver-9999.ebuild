# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_core

DESCRIPTION="Archive manager"
HOMEPAGE="http://xarchiver.xfce.org/"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-2.10:2
	>=dev-libs/glib-2.10:2"
DEPEND="${RDEPEND}
	dev-util/intltool"

pkg_postinst() {
	xfce4_pkg_postinst

	elog
	elog "You need external programs for some formats, including"
	elog "arj - app-arch/unarj app-arch/arj"
	elog "zip - app-arch/unzip app-arch/zip"
	elog "rar - app-arch/unrar app-arch/rar"
	elog "7zip - app-arch/p7zip"
	elog "lha - app-arch/lha"
	elog
}

DOCS="AUTHORS ChangeLog NEWS README TODO"
