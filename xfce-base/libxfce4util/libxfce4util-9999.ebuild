# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/libxfce4util/libxfce4util-4.9.1.ebuild,v 1.2 2012/05/05 06:56:38 mgorny Exp $

EAPI=4
inherit xfconf

DESCRIPTION="A basic utility library for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.24"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		$(xfconf_use_debug)
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)

	[[ ${CHOST} == *-darwin* ]] && XFCONF+=( --disable-visibility ) #366857

	DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )
}
