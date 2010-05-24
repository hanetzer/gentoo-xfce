# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_apps

DESCRIPTION="a GTK+ based and advanced archive manager for use with Thunar file manager."
HOMEPAGE="http://squeeze.xfce.org"
KEYWORDS="~alpha ~amd64 -hppa ~ia64 ~ppc ~ppc64 -sparc ~x86 ~x86-fbsd"
IUSE="debug +pathbar +toolbar"

RDEPEND="x11-libs/gtk+:2
	dev-libs/dbus-glib
	>=xfce-base/libxfce4util-4.4
	xfce-extra/thunar-vfs"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --disable-gtk-doc
		--disable-dependency-tracking
		$(use_enable pathbar)
		$(use_enable toolbar)"
	DOCS="AUTHORS ChangeLog NEWS README TODO"
}

src_unpack() {
	xfce4_src_unpack
	mkdir "${S}"/m4
}
