# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_core

DESCRIPTION="Xfce's basic utilities library"
HOMEPAGE="http://www.xfce.org/projects/libraries/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x64-solaris ~x86-solaris"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.12:2"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc
	sys-devel/gettext"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG=" --disable-dependency-tracking
		--disable-static
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"

	DOCS="AUTHORS NEWS README THANKS TODO"
}
