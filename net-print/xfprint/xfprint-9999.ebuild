# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_archive

DESCRIPTION="Frontend for printing, management and job queue."
HOMEPAGE="http://www.xfce.org/projects/xfprint"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="cups debug"

RDEPEND="app-text/a2ps
	>=dev-libs/glib-2.10:2
	>=x11-libs/gtk+-2.10:2
	>=xfce-base/libxfce4util-4.6
	>=xfce-base/libxfcegui4-4.6
	>=xfce-base/xfconf-4.6
	cups? ( net-print/cups )
	!cups? ( net-print/lprng )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --enable-bsdlpr
		$(use_enable cups)"
	DOCS="AUTHORS ChangeLog NEWS README TODO"
}

src_prepare() {
	sed -i -e "/24x24/d" "${S}"/icons/Makefile.am || die "sed failed"
	xfce4_src_prepare
}
