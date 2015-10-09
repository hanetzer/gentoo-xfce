# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit xfconf

DESCRIPTION="A basic utility library for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="LGPL-2"
SLOT="0/7"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.24"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc-am
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	XFCONF=(
		$(xfconf_use_debug)
		)

	[[ ${CHOST} == *-darwin* ]] && XFCONF+=( --disable-visibility ) #366857

	DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )
}
