# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfce4-panel/xfce4-panel-4.9.1.ebuild,v 1.1 2012/03/31 05:10:50 ssuominen Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Panel for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=dev-libs/dbus-glib-0.98
	>=dev-libs/glib-2.18
	>=x11-libs/cairo-1
	>=x11-libs/gtk+-2.14:2
	x11-libs/libX11
	>=x11-libs/libwnck-2.22:1
	>=xfce-base/exo-0.7
	>=xfce-base/garcon-0.1.11
	>=xfce-base/libxfce4ui-4.9
	>=xfce-base/libxfce4util-4.9
	>=xfce-base/xfconf-4.9"
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		$(xfconf_use_debug)
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)

	DOCS=( AUTHORS ChangeLog NEWS THANKS )
}
