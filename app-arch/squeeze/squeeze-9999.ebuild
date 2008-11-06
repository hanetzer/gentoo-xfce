# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_core

DESCRIPTION="a GTK+ based and advanced archive manager for use with Thunar file manager."
HOMEPAGE="http://squeeze.xfce.org"
KEYWORDS="~alpha ~amd64 -hppa ~ia64 ~ppc ~ppc64 -sparc ~x86 ~x86-fbsd"
IUSE="debug +pathbar +toolbar"

RDEPEND="x11-libs/gtk+:2
	dev-libs/dbus-glib
	>=xfce-base/libxfce4util-${XFCE_VERSION}
	>=xfce-base/thunar-${XFCE_VERSION}"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext"

XFCE_CONFIG+="--disable-gtk-doc	$(use_enable pathbar) \
	$(use_enable toolbar) $(use_enable debug)"

DOCS="AUTHORS ChangeLog NEWS TODO"
