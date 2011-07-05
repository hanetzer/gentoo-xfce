# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/exo/exo-0.6.2.ebuild,v 1.1 2011/06/10 18:38:28 angelos Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Extensions, widgets and framework library with session management support"
HOMEPAGE="http://www.xfce.org/projects/exo/"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=dev-lang/perl-5.6
	dev-perl/URI
	>=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.14:2
	x11-libs/libX11
	>=xfce-base/libxfce4ui-4.8
	>=xfce-base/libxfce4util-4.8"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		--disable-static
		$(xfconf_use_debug)
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)
	[[ ${CHOST} == *-darwin* ]] && XFCONF+=( --disable-visibility ) # 366857

	DOCS=( AUTHORS ChangeLog HACKING NEWS README THANKS TODO )
}
