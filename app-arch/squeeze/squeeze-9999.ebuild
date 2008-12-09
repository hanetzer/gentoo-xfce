# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_core

DESCRIPTION="a GTK+ based and advanced archive manager for use with Thunar"
HOMEPAGE="http://squeeze.xfce.org"
KEYWORDS="~alpha ~amd64 -hppa ~ia64 ~ppc ~ppc64 -sparc ~x86 ~x86-fbsd"
IUSE="debug +pathbar +toolbar"

RDEPEND="dev-libs/dbus-glib
	x11-libs/gtk+:2
	>=xfce-base/libxfce4util-${XFCE_VERSION}
	>=xfce-base/thunar-${XFCE_VERSION}"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext"

pkg_setup() {
	XFCE_CONFIG+=" $(use_enable pathbar) $(use_enable toolbar) $(use_enable debug)"
}

src_unpack() {
	xfce4_src_unpack
	echo "src/button_drag_box.c" >> "${S}"/po/POTFILES.in
	echo "src/preferences_dialog.c" >> "${S}"/po/POTFILES.in
	echo "src/properties_dialog.c" >> "${S}"/po/POTFILES.in
}

DOCS="AUTHORS ChangeLog NEWS README TODO"
