# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_core

DESCRIPTION="Application finder"
HOMEPAGE="http://www.xfce.org/projects/xfce4-appfinder"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.6:2
	>=x11-libs/gtk+-2.6:2
	>=xfce-base/libxfce4util-${XFCE_VERSION}
	>=xfce-base/libxfce4ui-${XFCE_VERSION}
	>=xfce-base/thunar-${XFCE_VERSION}"
DEPEND="${RDEPEND}
	dev-util/intltool"

src_unpack() {
	xfce4_src_unpack
	echo "src/appfinder.c" >> "${S}"/po/POTFILES.in
}

DOCS="AUTHORS ChangeLog NEWS README TODO"
