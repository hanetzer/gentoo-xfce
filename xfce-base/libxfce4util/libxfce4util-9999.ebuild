# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/libxfce4util/libxfce4util-4.8.2.ebuild,v 1.8 2012/03/23 21:19:03 angelos Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Xfce's basic utilities library"
HOMEPAGE="http://www.xfce.org/projects/libraries/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.12:2"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		--disable-static
		$(xfconf_use_debug)
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)

	[[ ${CHOST} == *-darwin* ]] && XFCONF+=( --disable-visibility ) #366857

	DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )
}
