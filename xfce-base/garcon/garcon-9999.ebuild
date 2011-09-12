# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/garcon/garcon-0.1.9.ebuild,v 1.2 2011/09/12 19:22:45 angelos Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Xfce's freedesktop.org specification compatible menu implementation library"
HOMEPAGE="http://www.xfce.org/projects/libraries/"

LICENSE="LGPL-2 FDL-1.1"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.14:2
	>=xfce-base/libxfce4util-4.8
	!<xfce-base/xfdesktop-4.7.0"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		--disable-static
		$(xfconf_use_debug)
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)

	DOCS=( AUTHORS ChangeLog HACKING NEWS README STATUS TODO )
}
