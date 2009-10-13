# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_apps

DESCRIPTION="a graphical GTK+ MPD client focusing on low footprint"
HOMEPAGE="http://goodies.xfce.org/projects/applications/xfmpc"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE=""

RDEPEND=">=media-libs/libmpd-0.15
	>=dev-libs/glib-2.14:2
	>=x11-libs/gtk+-2.12:2
	>=xfce-base/libxfcegui4-${XFCE_VERSION}
	>=xfce-base/libxfce4util-${XFCE_VERSION}"
DEPEND="${RDEPEND}
	dev-util/intltool
	xfce-extra/xfce4-vala"

XFCE_CONFIG+=" --enable-funky-colors"
DOCS="AUTHORS ChangeLog NEWS README THANKS"
