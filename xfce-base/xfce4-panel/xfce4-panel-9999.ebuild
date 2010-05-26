# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_core

DESCRIPTION="Panel for Xfce4"
HOMEPAGE="http://www.xfce.org/projects/xfce4-panel/"
LICENSE="GPL-2 LGPL-2.1"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="debug"

RDEPEND="x11-libs/libX11
	>=xfce-base/libxfce4util-4.6
	>=xfce-base/garcon-0.1.1
	>=xfce-base/libxfce4ui-4.7.1
	>=xfce-base/xfconf-4.7.2
	>=xfce-base/exo-0.5.1
	>=x11-libs/gtk+-2.14:2
	>=dev-libs/glib-2.18:2
	>=dev-libs/dbus-glib-0.73
	>=x11-libs/cairo-1
	>=x11-libs/libwnck-2.22"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --docdir=${EPREFIX}/usr/share/doc/${PF}
		--disable-static
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"
	DOCS="AUTHORS ChangeLog NEWS THANKS"
}
